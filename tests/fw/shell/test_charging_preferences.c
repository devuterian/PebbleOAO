/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */
#include "clar.h"
#include "shell/charging_preferences.h"

void test_charging_preferences__decimal_choices_and_full_charge(void) {
  char text[16];
  charging_display_format_percent(text, sizeof(text), 53253, 3);
  cl_assert_equal_s(text, "53.253%");
  charging_display_format_percent(text, sizeof(text), 53253, 2);
  cl_assert_equal_s(text, "53.25%");
  charging_display_format_percent(text, sizeof(text), 53253, 1);
  cl_assert_equal_s(text, "53.2%");
  charging_display_format_percent(text, sizeof(text), 53253, 0);
  cl_assert_equal_s(text, "53%");
  charging_display_format_percent(text, sizeof(text), 99999, 3);
  cl_assert_equal_s(text, "99.999%");
  charging_display_format_percent(text, sizeof(text), 100000, 3);
  cl_assert_equal_s(text, "100%");
  charging_display_format_percent(text, sizeof(text), 0, 3);
  cl_assert_equal_s(text, "0.000%");
}
void test_charging_preferences__invalid_stored_values_are_safe(void) {
  ChargingDisplayPrefs value = charging_display_normalize((ChargingDisplayPrefs){255,0,255,255});
  cl_assert_equal_i(value.decimals, 3);
  cl_assert_equal_i(value.seconds, 3);
  cl_assert_equal_i(value.flags, ChargingDisplayStock);
  cl_assert_equal_i(value.reserved, 0);
  value = charging_display_normalize((ChargingDisplayPrefs){0,60,0,0});
  cl_assert_equal_i(value.flags, 31);
  cl_assert_equal_i(value.seconds, 60);
}

void test_charging_preferences__three_display_modes(void) {
  const uint8_t modes[] = {31, ChargingDisplayStock,
                          ChargingDisplayIcon | ChargingDisplayPercent};
  for (unsigned i = 0; i < sizeof(modes); i++) {
    ChargingDisplayPrefs prefs = CHARGING_DISPLAY_DEFAULTS;
    prefs.flags = modes[i];
    cl_assert_equal_i(charging_display_normalize(prefs).flags, modes[i]);
  }
}
