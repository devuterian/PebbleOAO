/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */
#include "clar.h"
#include "services/battery/charge_estimate.h"

void test_battery_charge_estimate__uses_full_charge_model_for_100(void) {
  cl_assert_equal_i(charge_estimate_seconds(100, 3600, 5000, 6000, 600), 3600);
  // A valid gauge estimate wins even before enough SOC samples accumulate.
  cl_assert_equal_i(charge_estimate_seconds(100, 3600, 5000, 5000, 0), 3600);
}
void test_battery_charge_estimate__falls_back_when_full_charge_model_is_unavailable(void) {
  cl_assert_equal_i(charge_estimate_seconds(100, 0, 5000, 6000, 600), 2400);
  cl_assert_equal_i(charge_estimate_seconds(100, 86400, 5000, 6000, 600), 2400);
  cl_assert_equal_i(charge_estimate_seconds(100, UINT32_MAX, 5000, 6000, 600), 2400);
  cl_assert_equal_i(charge_estimate_seconds(100, 0, 9800, 9900, 180), 180);
}
void test_battery_charge_estimate__full_charge_fallback_waits_for_valid_samples(void) {
  cl_assert_equal_i(charge_estimate_seconds(100, 0, 5000, 6000, 179), 0);
  cl_assert_equal_i(charge_estimate_seconds(100, 0, 5000, 5099, 600), 0);
  cl_assert_equal_i(charge_estimate_seconds(100, 0, 5000, 5000, 600), 0);
  cl_assert_equal_i(charge_estimate_seconds(100, 0, 5000, 4900, 600), 0);
  cl_assert_equal_i(charge_estimate_seconds(100, 0, 9900, 10000, 600), 0);
  cl_assert_equal_i(charge_estimate_seconds(100, 0, 100, 200, UINT32_MAX), 0);
}
void test_battery_charge_estimate__uses_observed_rate_below_full(void) {
  // Ten percent in ten minutes: another twenty percent takes twenty minutes.
  cl_assert_equal_i(charge_estimate_seconds(80, 9999, 5000, 6000, 600), 1200);
  cl_assert_equal_i(charge_estimate_seconds(80, 9999, 7700, 7800, 180), 360);
  cl_assert_equal_i(charge_estimate_seconds(90, 9999, 5000, 6000, 600), 1800);
}
void test_battery_charge_estimate__rejects_insufficient_or_invalid_samples(void) {
  cl_assert_equal_i(charge_estimate_seconds(80, 0, 5000, 6000, 179), 0);
  cl_assert_equal_i(charge_estimate_seconds(80, 0, 5000, 5099, 600), 0);
  cl_assert_equal_i(charge_estimate_seconds(80, 0, 5000, 4900, 600), 0);
  cl_assert_equal_i(charge_estimate_seconds(80, 0, 5000, 5000, 600), 0);
  cl_assert_equal_i(charge_estimate_seconds(80, 0, 7800, 8000, 600), 0);
  cl_assert_equal_i(charge_estimate_seconds(80, 0, 100, 200, 86400), 0);
}
