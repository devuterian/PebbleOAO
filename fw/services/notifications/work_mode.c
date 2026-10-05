/* SPDX-FileCopyrightText: 2026 devuterian */
/* SPDX-License-Identifier: Apache-2.0 */

#include "pbl/services/notifications/work_mode.h"

#include "applib/ui/dialogs/dialog.h"
#include "applib/ui/dialogs/simple_dialog.h"
#include "kernel/event_loop.h"
#include "kernel/ui/modals/modal_manager.h"
#include "resource/resource_ids.auto.h"
#include "pbl/services/activity/activity.h"
#include "pbl/services/i18n/i18n.h"
#include <pbl/logging/logging.h>

#include <stdint.h>
#include <stdio.h>
#include <string.h>

PBL_LOG_MODULE_DECLARE(service_notifications, CONFIG_SERVICE_NOTIFICATIONS_LOG_LEVEL);

#define WORK_MODE_DIALOG_TIMEOUT_MS (2500)
#define WORK_MODE_SUMMARY_LEN       (96)

static uint16_t s_notification_count;
static uint16_t s_call_count;
static uint8_t s_i18n_owner;

static void prv_push_dialog(const char *text) {
  SimpleDialog *simple_dialog = simple_dialog_create("WorkMode");
  Dialog *dialog = simple_dialog_get_dialog(simple_dialog);
  dialog_set_text(dialog, text);
  dialog_set_icon(dialog, RESOURCE_ID_GENERIC_CONFIRMATION_LARGE);
  dialog_set_background_color(dialog, PBL_IF_COLOR_ELSE(GColorCobaltBlue, GColorWhite));
  dialog_set_text_color(dialog, PBL_IF_COLOR_ELSE(GColorWhite, GColorBlack));
  dialog_set_timeout(dialog, WORK_MODE_DIALOG_TIMEOUT_MS);
  simple_dialog_push(simple_dialog, modal_manager_get_window_stack(ModalPriorityAlert));
}

static void prv_show_started(void) {
  /// Shown when work mode is turned on
  prv_push_dialog(i18n_get("Work Mode\nStarted", &s_i18n_owner));
  i18n_free_all(&s_i18n_owner);
}

static void prv_show_ended(void) {
  char text[WORK_MODE_SUMMARY_LEN];
  char line[WORK_MODE_SUMMARY_LEN / 2];
  /// Shown when work mode is turned off
  snprintf(text, sizeof(text), "%s", i18n_get("Work Mode\nEnded", &s_i18n_owner));
  if (s_notification_count > 0) {
    /// Number of notifications that arrived during work mode
    snprintf(line, sizeof(line), i18n_get("%u notifications", &s_i18n_owner), s_notification_count);
    strncat(text, "\n", sizeof(text) - strlen(text) - 1);
    strncat(text, line, sizeof(text) - strlen(text) - 1);
  }
  if (s_call_count > 0) {
    /// Number of phone calls that arrived during work mode
    snprintf(line, sizeof(line), i18n_get("%u calls", &s_i18n_owner), s_call_count);
    strncat(text, "\n", sizeof(text) - strlen(text) - 1);
    strncat(text, line, sizeof(text) - strlen(text) - 1);
  }
  prv_push_dialog(text);
  i18n_free_all(&s_i18n_owner);
}

static void prv_apply_kernel_cb(void *data) {
  const bool active = (bool)(uintptr_t)data;
  activity_handle_work_mode_changed();
  if (active) {
    prv_show_started();
  } else {
    prv_show_ended();
  }
}

bool work_mode_is_active(void) {
  return alerts_preferences_get_work_mode_active();
}

void work_mode_set_active(bool active) {
  if (active == work_mode_is_active()) {
    return;
  }
  PBL_LOG_DBG("Work mode: %s", active ? "on" : "off");
  if (active) {
    s_notification_count = 0;
    s_call_count = 0;
  }
  alerts_preferences_set_work_mode_active(active);
  launcher_task_add_callback(prv_apply_kernel_cb, (void *)(uintptr_t)active);
}

void work_mode_toggle(void) {
  work_mode_set_active(!work_mode_is_active());
}

WorkModeAlertStyle work_mode_get_alert_style(AlertType type) {
  if (!work_mode_is_active()) {
    return WorkModeAlertStyle_Vibrate;
  }
  return (type == AlertPhoneCall) ? alerts_preferences_get_work_mode_call_style()
                                  : alerts_preferences_get_work_mode_notification_style();
}

void work_mode_count_alert(AlertType type) {
  if (!work_mode_is_active()) {
    return;
  }
  uint16_t *count = (type == AlertPhoneCall) ? &s_call_count : &s_notification_count;
  if (*count < UINT16_MAX) {
    (*count)++;
  }
}
