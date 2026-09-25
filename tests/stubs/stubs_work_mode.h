/* SPDX-FileCopyrightText: 2026 devuterian */
/* SPDX-License-Identifier: Apache-2.0 */

#pragma once

#include "pbl/services/notifications/work_mode.h"
#include "pbl/kernel/compiler.h"

bool PBL_WEAK work_mode_is_active(void) {
  return false;
}

WorkModeAlertStyle PBL_WEAK work_mode_get_alert_style(AlertType type) {
  return WorkModeAlertStyle_Vibrate;
}

void PBL_WEAK work_mode_count_alert(AlertType type) {
}
