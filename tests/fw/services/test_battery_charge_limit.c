/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */

#include "clar.h"
#include "pbl/services/battery/battery_charge_limit.h"
#include "pbl/services/regular_timer.h"
#include "kernel/event_loop.h"
#include "stubs_logging.h"

static uint8_t s_limit;
static bool s_charging;
static uint32_t s_millipercent;
uint32_t battery_state_get_millipercent(void) { return s_millipercent; }
static int s_writes, s_callbacks;
static BatteryChargeState s_charge;
static RegularTimerInfo *s_timer;
static CallbackEventCallback s_callback;

bool shell_prefs_get_charge_limit_enabled(void) { return s_limit < 100; }
uint8_t shell_prefs_get_charge_limit_percent(void) { return s_limit; }
void battery_set_charge_enable(bool enabled) { s_charging = enabled; s_writes++; }
BatteryChargeState battery_get_charge_state(void) { return s_charge; }
void regular_timer_add_multisecond_callback(RegularTimerInfo *cb, uint16_t seconds) {
  cl_assert_equal_i(seconds, 60);
  s_timer = cb;
}
bool regular_timer_is_scheduled(RegularTimerInfo *cb) { return s_timer == cb; }
bool regular_timer_remove_callback(RegularTimerInfo *cb) {
  if (s_timer != cb) {
    return false;
  }
  s_timer = NULL;
  return true;
}
void launcher_task_add_callback(CallbackEventCallback callback, void *data) {
  s_callbacks++;
  s_callback = callback;
}

static void prv_evaluate(int pct, bool plugged) {
  s_millipercent = pct * 1000U;
  battery_charge_limit_evaluate((PreciseBatteryChargeState){ .pct = pct, .is_plugged = plugged });
}

void test_battery_charge_limit__initialize(void) {
  s_limit = 100;
  prv_evaluate(0, false);
  s_limit = 80;
  s_charging = true;
  s_writes = s_callbacks = 0;
  s_timer = NULL;
  s_charge = (BatteryChargeState){ .charge_percent = 50, .is_plugged = true };
  battery_charge_limit_init();
  cl_assert_equal_i(s_callbacks, 1);
  s_callback(NULL);
  s_callbacks = 0;
}

void test_battery_charge_limit__stops_at_80_and_resumes_at_77(void) {
  prv_evaluate(79, true);
  cl_assert_equal_i(s_writes, 0);
  prv_evaluate(80, true);
  cl_assert(!s_charging);
  cl_assert(battery_charge_limit_is_active());
  prv_evaluate(79, true);
  prv_evaluate(78, true);
  cl_assert_equal_i(s_writes, 1);
  prv_evaluate(77, true);
  cl_assert(s_charging);
  cl_assert(!battery_charge_limit_is_active());
}

void test_battery_charge_limit__unplug_restores_charger_for_next_connection(void) {
  prv_evaluate(85, true);
  prv_evaluate(85, false);
  cl_assert(s_charging);
  cl_assert(!battery_charge_limit_is_active());
  prv_evaluate(70, true);
  cl_assert(s_charging);
}

void test_battery_charge_limit__timer_only_runs_while_enabled_and_plugged(void) {
  cl_assert(s_timer);
  prv_evaluate(50, false);
  cl_assert(!s_timer);
  prv_evaluate(50, true);
  cl_assert(s_timer);
  s_limit = 100;
  prv_evaluate(50, true);
  cl_assert(!s_timer);
}

void test_battery_charge_limit__disabling_restores_charging(void) {
  prv_evaluate(80, true);
  s_limit = 100;
  prv_evaluate(80, true);
  cl_assert(s_charging);
  cl_assert(!battery_charge_limit_is_active());
}

void test_battery_charge_limit__timer_defers_hardware_write_to_kernel(void) {
  s_millipercent = 80000;
  s_charge = (BatteryChargeState){ .charge_percent = 80, .is_plugged = true };
  s_timer->cb(NULL);
  cl_assert_equal_i(s_callbacks, 1);
  cl_assert_equal_i(s_writes, 0);
  s_callback(NULL);
  cl_assert(!s_charging);
}

void test_battery_charge_limit__does_not_round_thresholds_up(void) {
  s_millipercent = 79999;
  battery_charge_limit_evaluate((PreciseBatteryChargeState){ .pct = 80, .is_plugged = true });
  cl_assert(!battery_charge_limit_is_active());
  prv_evaluate(80, true);
  s_millipercent = 77001;
  battery_charge_limit_evaluate((PreciseBatteryChargeState){ .pct = 78, .is_plugged = true });
  cl_assert(battery_charge_limit_is_active());
  prv_evaluate(77, true);
  cl_assert(!battery_charge_limit_is_active());
}

void test_battery_charge_limit__supports_90_percent_mode(void) {
  s_limit = 90;
  prv_evaluate(89, true);
  cl_assert(!battery_charge_limit_is_active());
  prv_evaluate(90, true);
  cl_assert(battery_charge_limit_is_active());
  prv_evaluate(87, true);
  cl_assert(!battery_charge_limit_is_active());
}

void test_battery_charge_limit__one_time_full_resets_after_unplug(void) {
  prv_evaluate(80, true);
  cl_assert(battery_charge_limit_is_active());
  battery_charge_limit_charge_once_to_full();
  s_callback(NULL);
  cl_assert(s_charging);
  cl_assert(battery_charge_limit_is_once_to_full());
  prv_evaluate(90, false);
  cl_assert(!battery_charge_limit_is_once_to_full());
}
