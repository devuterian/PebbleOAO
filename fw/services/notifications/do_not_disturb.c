/* SPDX-FileCopyrightText: 2024 Google LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#include <errno.h>

#include <pbl/cron/cron.h>
#include <pbl/drivers/rtc.h>
#include <pbl/kernel/mutex.h>
#include <pbl/kernel/syscall.h>
#include <pbl/logging/logging.h>
#include <pbl/services/activity/activity.h>
#include <pbl/services/i18n/i18n.h>
#include <pbl/services/notifications/alerts_preferences.h>
#include <pbl/services/notifications/alerts_preferences_private.h>
#include <pbl/services/notifications/do_not_disturb.h>
#include <pbl/services/notifications/do_not_disturb_toggle.h>
#include <pbl/services/system_task.h>
#include <pbl/services/timeline/calendar.h>
#include <pbl/util/math.h>
#include <pbl/util/time.h>
#include <pbl/util/units.h>

#include <applib/ui/action_toggle.h>
#include <applib/ui/app_window_stack.h>
#include <applib/ui/dialogs/actionable_dialog.h>
#include <applib/ui/dialogs/dialog.h>
#include <applib/ui/dialogs/expandable_dialog.h>
#include <applib/ui/window_manager.h>
#include <kernel/events.h>
#include <kernel/ui/modals/modal_manager.h>
#include <process_state/app_state/app_state.h>
#include <resource/resource_ids.auto.h>

PBL_LOG_MODULE_DECLARE(service_notifications, CONFIG_SERVICE_NOTIFICATIONS_LOG_LEVEL);

typedef struct DoNotDisturbData {
  ActivitySleepState sleep_state;
  bool is_in_schedule_period;
  bool manually_override_dnd;
  //! Sleep Aware was turned off by hand until waking up is confirmed
  bool sleep_dnd_override;
  //! Last seen Sleep Aware setting, to notice a change synced from the phone
  bool sleep_dnd_enabled;
  bool was_active;
} DoNotDisturbData;

static DoNotDisturbData s_data;

//! Until Wake ends by itself after this long, in case sleep is never seen, e.g. off the wrist
#define DND_UNTIL_WAKE_MAX_SEC (18 * PBL_SEC_PER_HOUR)

//! Guards Until Wake state changes, which come from the app, KernelMain and KernelBG
static PBL_MUTEX_DEFINE(s_until_wake_mutex);

static void prv_until_wake_cron_callback(struct pbl_cron_job *job, void *data);
static struct pbl_cron_job s_until_wake_job = {
  .cb = prv_until_wake_cron_callback,
};

//! Cron jobs for the start and end of each schedule slot's period, and for midnight where a
//! legacy slot's period starts or stops.
static struct pbl_cron_job s_schedule_from_jobs[DND_NUM_SCHEDULE_SLOTS];
static struct pbl_cron_job s_schedule_to_jobs[DND_NUM_SCHEDULE_SLOTS];
static struct pbl_cron_job s_schedule_midnight_jobs[DND_NUM_SCHEDULE_SLOTS];

static bool prv_is_smart_dnd_active(void);
static bool prv_is_schedule_active(void);
static bool prv_is_sleep_dnd_active(void);
static bool prv_is_until_wake_active(void);
static void prv_update_schedule_mode(void);
static void prv_set_manually_enabled(bool enable, bool by_user);

static void prv_update_active_time(bool is_active) {
  if (is_active) {
  } else {
  }
}

static void prv_put_dnd_event(bool is_active) {
  PebbleEvent e = (PebbleEvent){
    .type = PEBBLE_DO_NOT_DISTURB_EVENT,
    .do_not_disturb = {
      .is_active = is_active,
    }
  };

  event_put(&e);
}

static char *prv_bool_to_string(bool active) {
  return active ? "Active" : "Inactive";
}

static void prv_do_update(void) {
  const bool is_active = do_not_disturb_is_active();
  if (is_active == s_data.was_active) {
    // No change
    return;
  }
  s_data.was_active = is_active;
  PBL_LOG_DBG("Quiet Time: %s", prv_bool_to_string(is_active));

  prv_update_active_time(is_active);
  prv_put_dnd_event(is_active);
}

static void prv_toggle_smart_dnd(void *e_dialog) {
  alerts_preferences_dnd_set_smart_enabled(!alerts_preferences_dnd_is_smart_enabled());
  s_data.manually_override_dnd = false;
  prv_do_update();
}

static void prv_toggle_manual_dnd_from_action_menu(void *e_dialog) {
  do_not_disturb_toggle_push(ActionTogglePrompt_NoPrompt, false /* set_exit_reason */);
}

static void prv_toggle_manual_dnd_from_settings_menu(void *e_dialog) {
  do_not_disturb_set_manually_enabled(!do_not_disturb_is_manually_enabled());
}

static void prv_push_first_use_dialog(const char *msg, DialogCallback dialog_close_cb) {
  DialogCallbacks callbacks = {.unload = dialog_close_cb};
  ExpandableDialog *first_use_dialog = expandable_dialog_create_with_params(
      "DNDFirstUse", RESOURCE_ID_QUIET_TIME, msg, GColorBlack, GColorMediumAquamarine, &callbacks,
      RESOURCE_ID_ACTION_BAR_ICON_CHECK, expandable_dialog_close_cb);
  i18n_free(msg, &s_data);
  expandable_dialog_push(first_use_dialog,
                         window_manager_get_window_stack(ModalPriorityNotification));
}

static void prv_push_smart_dnd_first_use_dialog(void) {
  const char *msg = i18n_get(
      "Calendar Aware enables Quiet Time automatically during "
      "calendar events.",
      &s_data);
  prv_push_first_use_dialog(msg, prv_toggle_smart_dnd);
}

static void prv_push_manual_dnd_first_use_dialog(ManualDNDFirstUseSource source) {
  const char *msg = i18n_get(
      "Press and hold the Back button from a notification to turn "
      "Quiet Time on or off.",
      &s_data);
  if (source == ManualDNDFirstUseSourceActionMenu) {
    prv_push_first_use_dialog(msg, prv_toggle_manual_dnd_from_action_menu);
  } else {
    prv_push_first_use_dialog(msg, prv_toggle_manual_dnd_from_settings_menu);
  }
}

static void prv_try_update_schedule_mode(void *data) {
  const bool clear_override = (bool)(uintptr_t)data;
  if (clear_override) {
    s_data.manually_override_dnd = false;
  }
  prv_update_schedule_mode();
  prv_do_update();
}

static void prv_try_update_schedule_mode_callback(bool clear_manual_override) {
  system_task_add_callback(prv_try_update_schedule_mode, (void *)(uintptr_t)clear_manual_override);
}

static void prv_schedule_cron_callback(struct pbl_cron_job *job, void *data) {
  prv_try_update_schedule_mode_callback(true);
}

//! Move each day in a PBL_CRON_WDAY_ mask to the day after.
static uint8_t prv_next_days(uint8_t days) {
  return ((days << 1) | (days >> (PBL_DAY_PER_WEEK - 1))) & PBL_CRON_WDAY_ANY;
}

static int prv_minutes(uint8_t hour, uint8_t minute) {
  return hour * PBL_MIN_PER_HOUR + minute;
}

static bool prv_is_in_slot_period(const DoNotDisturbScheduleSlot *slot, const struct pbl_tm *now) {
  const DoNotDisturbSchedule *schedule = &slot->schedule;
  const int from = prv_minutes(schedule->from_hour, schedule->from_minute);
  const int to = prv_minutes(schedule->to_hour, schedule->to_minute);
  const int minute = prv_minutes(now->tm_hour, now->tm_min);
  const uint8_t days = do_not_disturb_schedule_slot_get_days(slot);
  const uint8_t today = 1 << now->tm_wday;

  if (from < to) {
    return (days & today) && minute >= from && minute < to;
  }
  if (from == to) {
    return false;
  }
  if (slot->legacy) {
    return (days & today) && (minute >= from || minute < to);
  }
  // After midnight, the period started the day before
  return ((days & today) && minute >= from) || ((prv_next_days(days) & today) && minute < to);
}

static void prv_schedule_job(struct pbl_cron_job *job, int hour, int minute, uint8_t wday) {
  *job = (struct pbl_cron_job){
    .cb = prv_schedule_cron_callback,
    .minute = minute,
    .hour = hour,
    .mday = PBL_CRON_MDAY_ANY,
    .month = PBL_CRON_MONTH_ANY,
    .wday = wday,
  };
  pbl_cron_job_schedule(job);
}

static void prv_schedule_slot_jobs(unsigned int index, const DoNotDisturbScheduleSlot *slot) {
  const DoNotDisturbSchedule *schedule = &slot->schedule;
  const int from = prv_minutes(schedule->from_hour, schedule->from_minute);
  const int to = prv_minutes(schedule->to_hour, schedule->to_minute);
  const uint8_t days = do_not_disturb_schedule_slot_get_days(slot);
  // A zero mask would fire every day
  if (days == 0 || from == to) {
    return;
  }

  prv_schedule_job(&s_schedule_from_jobs[index], schedule->from_hour, schedule->from_minute, days);
  if (from < to || !slot->legacy) {
    prv_schedule_job(&s_schedule_to_jobs[index], schedule->to_hour, schedule->to_minute,
                     (from < to) ? days : prv_next_days(days));
    return;
  }

  prv_schedule_job(&s_schedule_to_jobs[index], schedule->to_hour, schedule->to_minute, days);
  // The period starts or stops at midnight on days next to an unscheduled one
  const uint8_t midnight_days = days ^ prv_next_days(days);
  if (midnight_days != 0) {
    prv_schedule_job(&s_schedule_midnight_jobs[index], 0, 0, midnight_days);
  }
}

static void prv_update_schedule_mode(void) {
  struct pbl_tm now;
  rtc_get_time_tm(&now);

  bool in_period = false;
  for (unsigned int i = 0; i < DND_NUM_SCHEDULE_SLOTS; i++) {
    pbl_cron_job_unschedule(&s_schedule_from_jobs[i]);
    pbl_cron_job_unschedule(&s_schedule_to_jobs[i]);
    pbl_cron_job_unschedule(&s_schedule_midnight_jobs[i]);

    DoNotDisturbScheduleSlot slot;
    alerts_preferences_dnd_get_schedule_slot(i, &slot);
    if (!slot.used || !slot.enabled) {
      continue;
    }
    prv_schedule_slot_jobs(i, &slot);
    in_period = in_period || prv_is_in_slot_period(&slot, &now);
  }

  // Coming out of scheduled DND with manual DND on, turning it off
  if (s_data.is_in_schedule_period && !in_period && do_not_disturb_is_manually_enabled()) {
    prv_set_manually_enabled(false, false /* by_user */);
  }
  s_data.is_in_schedule_period = in_period;
  PBL_LOG_DBG("%s scheduled period", s_data.is_in_schedule_period ? "In" : "Out of");
}

static bool prv_is_schedule_active(void) {
  return (s_data.is_in_schedule_period && !s_data.manually_override_dnd);
}

static bool prv_is_smart_dnd_active(void) {
  return (calendar_event_is_ongoing() && do_not_disturb_is_smart_dnd_enabled() &&
          !s_data.manually_override_dnd);
}

static bool prv_is_asleep(ActivitySleepState state) {
  return state == ActivitySleepStateLightSleep || state == ActivitySleepStateRestfulSleep;
}

static bool prv_is_sleep_dnd_active(void) {
  return do_not_disturb_is_sleep_dnd_enabled() && prv_is_asleep(s_data.sleep_state) &&
         !s_data.sleep_dnd_override;
}

static void prv_clear_sleep_override_if_setting_changed(void) {
  const bool enabled = do_not_disturb_is_sleep_dnd_enabled();
  if (enabled != s_data.sleep_dnd_enabled) {
    s_data.sleep_dnd_enabled = enabled;
    s_data.sleep_dnd_override = false;
  }
}

static bool prv_is_until_wake_active(void) {
  return alerts_preferences_dnd_get_until_wake_state() != DndUntilWakeStateDisabled;
}

//! Call with s_until_wake_mutex held
static void prv_until_wake_set_state(DndUntilWakeState state) {
  if (state == alerts_preferences_dnd_get_until_wake_state()) {
    return;
  }
  PBL_LOG_DBG("Until Wake: %d", state);
  alerts_preferences_dnd_set_until_wake_state(state);
  if (state == DndUntilWakeStateDisabled) {
    pbl_cron_job_unschedule(&s_until_wake_job);
  }
}

static void prv_until_wake_expired(void *data) {
  pbl_mutex_lock(&s_until_wake_mutex, PBL_FOREVER);
  if (prv_is_until_wake_active() &&
      rtc_get_time() >= alerts_preferences_dnd_get_until_wake_deadline()) {
    prv_until_wake_set_state(DndUntilWakeStateDisabled);
  }
  pbl_mutex_unlock(&s_until_wake_mutex);
  prv_do_update();
}

static void prv_until_wake_cron_callback(struct pbl_cron_job *job, void *data) {
  system_task_add_callback(prv_until_wake_expired, nullptr);
}

//! Call with s_until_wake_mutex held
static void prv_until_wake_schedule_deadline(void) {
  time_t deadline = alerts_preferences_dnd_get_until_wake_deadline();
  const time_t now = rtc_get_time();
  if (deadline <= now) {
    prv_until_wake_set_state(DndUntilWakeStateDisabled);
    return;
  }
  // The clock was moved back
  if (deadline - now > DND_UNTIL_WAKE_MAX_SEC) {
    deadline = now + DND_UNTIL_WAKE_MAX_SEC;
    alerts_preferences_dnd_set_until_wake_deadline(deadline);
  }
  pbl_cron_job_schedule_at(&s_until_wake_job, deadline);
}

static void prv_until_wake_handle_sleep_state(ActivitySleepState state, bool wake_confirmed) {
  pbl_mutex_lock(&s_until_wake_mutex, PBL_FOREVER);
  const DndUntilWakeState until_wake = alerts_preferences_dnd_get_until_wake_state();
  if (until_wake == DndUntilWakeStateWaitingForSleep && prv_is_asleep(state)) {
    prv_until_wake_set_state(DndUntilWakeStateWaitingForWake);
  } else if (until_wake == DndUntilWakeStateWaitingForWake && wake_confirmed) {
    prv_until_wake_set_state(DndUntilWakeStateDisabled);
  }
  pbl_mutex_unlock(&s_until_wake_mutex);
}

static void prv_set_sleep_state(ActivitySleepState state, bool wake_confirmed) {
  if (state > ActivitySleepStateUnknown) {
    state = ActivitySleepStateUnknown;
  }
  s_data.sleep_state = state;
  // A manual override lasts for the current sleep
  if (wake_confirmed) {
    s_data.sleep_dnd_override = false;
  }
  prv_until_wake_handle_sleep_state(state, wake_confirmed);
  prv_do_update();
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//! Public Functions
///////////////////////////////////////////////////////////////////////////////////////////////////

PBL_SYSCALL(bool, sys_do_not_disturb_is_active) {
  return do_not_disturb_is_active();
}

bool do_not_disturb_is_active(void) {
  if (do_not_disturb_is_manually_enabled() || prv_is_schedule_active() ||
      prv_is_smart_dnd_active() || prv_is_sleep_dnd_active() || prv_is_until_wake_active()) {
    return true;
  }
  return false;
}

bool do_not_disturb_is_manually_enabled(void) {
  return alerts_preferences_dnd_is_manually_enabled();
}

static void prv_set_manually_enabled(bool enable, bool by_user) {
  const bool was_manually_enabled = do_not_disturb_is_manually_enabled();
  const bool is_schedule_or_smart_active = prv_is_schedule_active() || prv_is_smart_dnd_active();
  const bool is_auto_dnd = s_data.is_in_schedule_period || do_not_disturb_is_smart_dnd_enabled();
  const bool is_sleep_dnd_active = prv_is_sleep_dnd_active();
  const bool was_active = do_not_disturb_is_active();

  alerts_preferences_dnd_set_manually_enabled(enable);
  // Turning the manual DND OFF in an active DND mode overrides the automatic mode. Ending Sleep
  // Aware DND alone leaves the schedule and calendar alone.
  if (!enable && was_active) {
    if (is_auto_dnd && (was_manually_enabled || is_schedule_or_smart_active)) {
      s_data.manually_override_dnd = true;
    }
    if (by_user && is_sleep_dnd_active) {
      s_data.sleep_dnd_override = true;
    }
  }
  prv_do_update();
}

void do_not_disturb_set_manually_enabled(bool enable) {
  prv_set_manually_enabled(enable, true /* by_user */);
}

void do_not_disturb_toggle_manually_enabled(ManualDNDFirstUseSource source) {
  FirstUseSource first_use_source = (FirstUseSource)source;
  if (!alerts_preferences_check_and_set_first_use_complete(first_use_source)) {
    prv_push_manual_dnd_first_use_dialog(source);
  } else {
    if (source == ManualDNDFirstUseSourceSettingsMenu) {
      prv_toggle_manual_dnd_from_settings_menu(nullptr);
    } else {
      prv_toggle_manual_dnd_from_action_menu(nullptr);
    }
  }
}

bool do_not_disturb_is_smart_dnd_enabled(void) {
  return alerts_preferences_dnd_is_smart_enabled();
}

void do_not_disturb_toggle_smart_dnd(void) {
  if (!alerts_preferences_check_and_set_first_use_complete(FirstUseSourceSmartDND)) {
    prv_push_smart_dnd_first_use_dialog();
  } else {
    prv_toggle_smart_dnd(nullptr);
  }
}

bool do_not_disturb_is_sleep_dnd_enabled(void) {
  return alerts_preferences_dnd_is_sleep_enabled();
}

void do_not_disturb_toggle_sleep_dnd(void) {
  alerts_preferences_dnd_set_sleep_enabled(!alerts_preferences_dnd_is_sleep_enabled());
  prv_clear_sleep_override_if_setting_changed();
  prv_do_update();
}

bool do_not_disturb_is_until_wake_enabled(void) {
  return prv_is_until_wake_active();
}

void do_not_disturb_set_until_wake_enabled(bool enable) {
  pbl_mutex_lock(&s_until_wake_mutex, PBL_FOREVER);
  if (!enable) {
    prv_until_wake_set_state(DndUntilWakeStateDisabled);
  } else if (!prv_is_until_wake_active()) {
    alerts_preferences_dnd_set_until_wake_deadline(rtc_get_time() + DND_UNTIL_WAKE_MAX_SEC);
    prv_until_wake_set_state(prv_is_asleep(s_data.sleep_state)
                                 ? DndUntilWakeStateWaitingForWake
                                 : DndUntilWakeStateWaitingForSleep);
    prv_until_wake_schedule_deadline();
  }
  pbl_mutex_unlock(&s_until_wake_mutex);
  prv_do_update();
}

void do_not_disturb_get_schedule_slot(unsigned int index, DoNotDisturbScheduleSlot *slot) {
  alerts_preferences_dnd_get_schedule_slot(index, slot);
}

int do_not_disturb_set_schedule_slot(unsigned int index, const DoNotDisturbScheduleSlot *slot) {
  if (index >= DND_NUM_SCHEDULE_SLOTS || !do_not_disturb_schedule_slot_is_valid(slot)) {
    return -EINVAL;
  }

  DoNotDisturbScheduleSlot current;
  alerts_preferences_dnd_get_schedule_slot(index, &current);
  DoNotDisturbScheduleSlot stored = *slot;
  stored.used = true;
  if (!current.used || do_not_disturb_schedule_slot_get_days(&current) !=
                           do_not_disturb_schedule_slot_get_days(&stored)) {
    stored.legacy = false;
  }
  alerts_preferences_dnd_set_schedule_slot(index, &stored);
  prv_try_update_schedule_mode_callback(true);
  return 0;
}

int do_not_disturb_add_schedule_slot(const DoNotDisturbScheduleSlot *slot) {
  if (!do_not_disturb_schedule_slot_is_valid(slot)) {
    return -EINVAL;
  }

  for (unsigned int i = 0; i < DND_NUM_SCHEDULE_SLOTS; i++) {
    DoNotDisturbScheduleSlot existing;
    alerts_preferences_dnd_get_schedule_slot(i, &existing);
    if (!existing.used) {
      do_not_disturb_set_schedule_slot(i, slot);
      return i;
    }
  }
  return -ENOSPC;
}

void do_not_disturb_delete_schedule_slot(unsigned int index) {
  if (index >= DND_NUM_SCHEDULE_SLOTS) {
    return;
  }

  alerts_preferences_dnd_set_schedule_slot(index, &(DoNotDisturbScheduleSlot){});
  prv_try_update_schedule_mode_callback(true);
}

void do_not_disturb_init(void) {
  // The sleep state follows on the first activity minute
  s_data = (DoNotDisturbData){
    .sleep_state = ActivitySleepStateUnknown,
    .sleep_dnd_enabled = do_not_disturb_is_sleep_dnd_enabled(),
    .was_active = false,
  };
  pbl_mutex_lock(&s_until_wake_mutex, PBL_FOREVER);
  if (prv_is_until_wake_active()) {
    prv_until_wake_schedule_deadline();
  }
  pbl_mutex_unlock(&s_until_wake_mutex);
  prv_try_update_schedule_mode((void *)true);
}

void do_not_disturb_handle_clock_change(void) {
  pbl_mutex_lock(&s_until_wake_mutex, PBL_FOREVER);
  if (prv_is_until_wake_active()) {
    prv_until_wake_schedule_deadline();
  }
  pbl_mutex_unlock(&s_until_wake_mutex);
  prv_try_update_schedule_mode_callback(false);
}

void do_not_disturb_handle_pref_synced(void) {
  prv_clear_sleep_override_if_setting_changed();
  prv_try_update_schedule_mode_callback(false);
}

void do_not_disturb_handle_calendar_event(PebbleCalendarEvent *e) {
  prv_do_update();
}

void do_not_disturb_handle_activity_event(PebbleActivityEvent *e) {
  switch (e->type) {
    case PebbleActivityEvent_TrackingStarted:
      // The sleep state follows on the first minute
      break;
    case PebbleActivityEvent_TrackingStopped:
      s_data.sleep_dnd_override = false;
      prv_set_sleep_state(ActivitySleepStateUnknown, false /* wake_confirmed */);
      break;
    case PebbleActivityEvent_SleepStateChanged:
      prv_set_sleep_state(e->sleep_state, e->wake_confirmed);
      break;
    case PebbleActivityEventNum:
      break;
  }
}

void do_not_disturb_manual_toggle_with_dialog(void) {
  do_not_disturb_toggle_push(ActionTogglePrompt_Auto, false /* set_exit_reason */);
}
