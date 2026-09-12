/* SPDX-FileCopyrightText: 2026 Shashvat Prabhu */
/* SPDX-License-Identifier: Apache-2.0 */

#include "pbl/services/battery/battery_charge_limit.h"

#include <pbl/drivers/battery.h>
#include "pbl/services/regular_timer.h"
#include "shell/prefs.h"
#include <pbl/logging/logging.h>
#include "pbl/util/attributes.h"
#include "kernel/event_loop.h"

#define CHARGE_RESUME_HYSTERESIS_PCT 3
#define PERIODIC_CHECK_INTERVAL_S 60

////////////////////////
// State
T_STATIC bool s_limit_active;
T_STATIC bool s_once_to_full;
T_STATIC bool s_once_to_full_was_plugged;
static RegularTimerInfo s_periodic_timer;

static void prv_set_periodic_check_enabled(bool enabled) {
  const bool is_scheduled = regular_timer_is_scheduled(&s_periodic_timer);
  if (enabled && !is_scheduled) {
    regular_timer_add_multisecond_callback(&s_periodic_timer, PERIODIC_CHECK_INTERVAL_S);
  } else if (!enabled && is_scheduled) {
    regular_timer_remove_callback(&s_periodic_timer);
  }
}

static void prv_evaluate_current(void *data) {
  BatteryChargeState charge = battery_get_charge_state();
  PreciseBatteryChargeState state = {
    .pct = charge.charge_percent,
    .is_plugged = charge.is_plugged,
    .is_charging = charge.is_charging,
  };
  battery_charge_limit_evaluate(state);
}

void battery_charge_limit_refresh(void) {
  launcher_task_add_callback(prv_evaluate_current, NULL);
}

static void prv_periodic_timer_cb(void *data) {
  battery_charge_limit_refresh();
}

void battery_charge_limit_init(void) {
  s_periodic_timer.cb = prv_periodic_timer_cb;
  battery_charge_limit_refresh();
}

void battery_charge_limit_evaluate(PreciseBatteryChargeState state) {
  const uint8_t limit = shell_prefs_get_charge_limit_percent();
  if (s_once_to_full) {
    if (state.is_plugged) {
      s_once_to_full_was_plugged = true;
    } else if (s_once_to_full_was_plugged) {
      s_once_to_full = false;
      s_once_to_full_was_plugged = false;
    }
  }

  if (limit >= 100 || s_once_to_full) {
    prv_set_periodic_check_enabled(false);
    if (s_limit_active) {
      battery_set_charge_enable(true);
      s_limit_active = false;
      PBL_LOG_DBG("Charge limit: disabled, re-enabling charging");
    }
    return;
  }

  if (!state.is_plugged) {
    prv_set_periodic_check_enabled(false);
    if (s_limit_active) {
      battery_set_charge_enable(true);
    }
    s_limit_active = false;
    return;
  }

  prv_set_periodic_check_enabled(true);

#if defined(CONFIG_BOARD_OBELIX) || defined(CONFIG_BOARD_QEMU_EMERY)
  uint32_t millipercent = battery_state_get_millipercent();
#else
  uint32_t millipercent = state.pct * 1000U;
#endif
  if (millipercent >= limit * 1000U && !s_limit_active) {
    battery_set_charge_enable(false);
    s_limit_active = true;
    PBL_LOG_DBG("Charge limit: disabling charging at %d pct", state.pct);
  } else if (millipercent <= (limit - CHARGE_RESUME_HYSTERESIS_PCT) * 1000U && s_limit_active) {
    battery_set_charge_enable(true);
    s_limit_active = false;
    PBL_LOG_DBG("Charge limit: resuming charging at %d pct", state.pct);
  }
}

bool battery_charge_limit_is_active(void) {
  return s_limit_active;
}

void battery_charge_limit_charge_once_to_full(void) {
  s_once_to_full = true;
  s_once_to_full_was_plugged = battery_get_charge_state().is_plugged;
  battery_charge_limit_refresh();
}

bool battery_charge_limit_is_once_to_full(void) {
  return s_once_to_full;
}
