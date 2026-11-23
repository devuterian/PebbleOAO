/* SPDX-FileCopyrightText: 2026 Shashvat Prabhu */
/* SPDX-License-Identifier: Apache-2.0 */

#include "pbl/services/battery/battery_charge_limit.h"

#include <pbl/drivers/battery.h>
#include <pbl/drivers/charger.h>
#include <pbl/kernel/work.h>
#include "shell/prefs.h"
#include <pbl/logging/logging.h>
#include "pbl/util/testing.h"
#include "kernel/event_loop.h"

#define CHARGE_RESUME_HYSTERESIS_PCT 3
#define PERIODIC_CHECK_INTERVAL_S 60

////////////////////////
// State
PBL_T_STATIC bool s_limit_active;
PBL_T_STATIC bool s_once_to_full;
PBL_T_STATIC bool s_once_to_full_was_plugged;
static struct pbl_wallclock_work s_periodic_timer;

static void prv_set_charge_enable(bool enable) {
  (void)pbl_charger_enable(CHARGER, enable);
}

static void prv_set_periodic_check_enabled(bool enabled) {
  const bool is_scheduled = pbl_wallclock_work_is_running(&s_periodic_timer);
  if (enabled && !is_scheduled) {
    pbl_wallclock_work_start(&pbl_sys_workq_high, &s_periodic_timer, PERIODIC_CHECK_INTERVAL_S, 1);
  } else if (!enabled && is_scheduled) {
    pbl_wallclock_work_stop(&s_periodic_timer);
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

static void prv_periodic_timer_cb(struct pbl_work *work) {
  battery_charge_limit_refresh();
}

void battery_charge_limit_init(void) {
  pbl_wallclock_work_init(&s_periodic_timer, prv_periodic_timer_cb);
  battery_charge_limit_refresh();
}

static volatile uint32_t s_stop_mpct = 80000;

uint32_t battery_charge_limit_get_stop_mpct(void) {
  return s_stop_mpct;
}

uint32_t battery_charge_limit_get_resume_mpct(void) {
  return s_stop_mpct - CHARGE_RESUME_HYSTERESIS_PCT * 1000U;
}

void battery_charge_limit_evaluate(PreciseBatteryChargeState state) {
  const uint8_t limit = shell_prefs_get_charge_limit_percent();
  if (limit < 100) {
    s_stop_mpct = limit * 1000U;
  }
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
      prv_set_charge_enable(true);
      s_limit_active = false;
      PBL_LOG_DBG("Charge limit: disabled, re-enabling charging");
    }
    return;
  }

  if (!state.is_plugged) {
    prv_set_periodic_check_enabled(false);
    if (s_limit_active) {
      prv_set_charge_enable(true);
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
    prv_set_charge_enable(false);
    s_limit_active = true;
    PBL_LOG_DBG("Charge limit: disabling charging at %d pct", state.pct);
  } else if (millipercent > (limit - CHARGE_RESUME_HYSTERESIS_PCT) * 1000U && s_limit_active) {
    // Keep the charger off: the fuel gauge enables it after its first update at boot, which can
    // land after the limit already engaged.
    prv_set_charge_enable(false);
  } else if (s_limit_active) {
    prv_set_charge_enable(true);
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
