/* SPDX-FileCopyrightText: 2026 devuterian */
/* SPDX-License-Identifier: Apache-2.0 */

#pragma once

#include <stdbool.h>

#include "pbl/services/notifications/alerts.h"
#include "pbl/services/notifications/alerts_preferences_private.h"

//! Work mode is for a watch taken off and left on the desk: alerts stop vibrating, notifications
//! are kept quietly in history, and background heart rate / SpO2 sampling pauses.

//! Backlight blinks for a notification using WorkModeAlertStyle_Flash
#define WORK_MODE_NOTIFICATION_FLASHES (2)

//! Backlight blinks per ring for a call using WorkModeAlertStyle_Flash
#define WORK_MODE_CALL_FLASHES (3)

//! Seconds between call flashes when there is no call vibration to pace them
#define WORK_MODE_CALL_FLASH_INTERVAL_S (2)

bool work_mode_is_active(void);

//! Turn work mode on or off. Shows a confirmation, and a summary of what arrived on the way out.
void work_mode_set_active(bool active);

void work_mode_toggle(void);

//! @return How an alert of this type should be delivered right now. WorkModeAlertStyle_Vibrate
//! means the regular behavior, which is also what is returned while work mode is off.
WorkModeAlertStyle work_mode_get_alert_style(AlertType type);

//! Count an alert that arrived during work mode, for the summary shown when it ends.
void work_mode_count_alert(AlertType type);
