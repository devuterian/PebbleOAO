/* SPDX-License-Identifier: Apache-2.0 */

#include "pbl/services/hourly_chime.h"

#include "kernel/low_power.h"
#include "pbl/drivers/rtc.h"
#include "pbl/kernel/mutex.h"
#include "pbl/services/firmware_update.h"
#include "pbl/services/notifications/alerts_preferences.h"
#include "pbl/services/notifications/do_not_disturb.h"
#include "pbl/services/settings/settings_file.h"
#include "pbl/services/speaker/speaker_service.h"
#include "pbl/services/system_task.h"
#include "resource/resource_ids.auto.h"

static PBL_MUTEX_DEFINE(s_lock);
static HourlyChimeSettings s_settings;
static time_t s_last_minute;

static bool prv_valid(const HourlyChimeSettings *settings) {
  return settings->start_minute < 1440 && settings->end_minute < 1440 && settings->enabled <= 1 &&
         (settings->interval_minutes == 30 || settings->interval_minutes == 60);
}

void hourly_chime_init(void) {
  s_settings = (HourlyChimeSettings){
      .start_minute = 600, .end_minute = 0, .interval_minutes = 60, .enabled = 1};
  s_last_minute = -1;
  SettingsFile file;
  if (settings_file_open(&file, "hourlychime", 128) == S_SUCCESS) {
    HourlyChimeSettings saved;
    if (settings_file_get(&file, "settings", 8, &saved, sizeof(saved)) == S_SUCCESS &&
        prv_valid(&saved)) {
      s_settings = saved;
    }
    settings_file_close(&file);
  }
}

HourlyChimeSettings hourly_chime_get_settings(void) {
  pbl_mutex_lock(&s_lock, PBL_FOREVER);
  const HourlyChimeSettings settings = s_settings;
  pbl_mutex_unlock(&s_lock);
  return settings;
}

bool hourly_chime_set_settings(const HourlyChimeSettings *settings) {
  if (!prv_valid(settings)) {
    return false;
  }
  pbl_mutex_lock(&s_lock, PBL_FOREVER);
  SettingsFile file;
  bool saved = false;
  if (settings_file_open(&file, "hourlychime", 128) == S_SUCCESS) {
    saved = settings_file_set(&file, "settings", 8, settings, sizeof(*settings)) == S_SUCCESS;
    settings_file_close(&file);
  }
  if (saved) {
    s_settings = *settings;
  }
  pbl_mutex_unlock(&s_lock);
  return saved;
}

static bool prv_due(time_t now) {
  const HourlyChimeSettings settings = hourly_chime_get_settings();
  if (!settings.enabled) {
    return false;
  }
  struct tm local;
  localtime_r(&now, &local);
  const int minute = local.tm_hour * 60 + local.tm_min;
  if (local.tm_sec >= 5 || minute % settings.interval_minutes != 0) {
    return false;
  }
  if (settings.start_minute < settings.end_minute) {
    return minute >= settings.start_minute && minute < settings.end_minute;
  }
  return minute >= settings.start_minute || minute < settings.end_minute;
}

static void prv_play(void *context) {
  const time_t scheduled = (time_t)(uintptr_t)context;
  const time_t now = rtc_get_time();
  // Recheck after queueing: never play late, after a clock change, or in Quiet Time.
  if (now < scheduled || now - scheduled >= 5 || !prv_due(now) || do_not_disturb_is_active() ||
      low_power_is_active() || firmware_update_is_in_progress() || speaker_service_is_muted() ||
      alerts_preferences_get_speaker_volume() == 0) {
    return;
  }
#ifdef CONFIG_KEY_SOUNDS
  speaker_service_stop_ui();
#endif
  if (speaker_service_get_state() != SpeakerStateIdle) {
    return;
  }
  speaker_service_play_chime_resource(RESOURCE_ID_HOURLY_CHIME);
}

void hourly_chime_tick(time_t now) {
  if (!prv_due(now)) {
    return;
  }
  const time_t minute = now / 60;
  pbl_mutex_lock(&s_lock, PBL_FOREVER);
  const bool duplicate = s_last_minute == minute;
  s_last_minute = minute;
  pbl_mutex_unlock(&s_lock);
  if (!duplicate) {
    system_task_add_callback(prv_play, (void *)(uintptr_t)now);
  }
}
