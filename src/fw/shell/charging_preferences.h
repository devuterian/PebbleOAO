/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */
#pragma once
#include <stdint.h>
#include <stdio.h>

enum {
  ChargingDisplayPercent = 1 << 0,
  ChargingDisplayPower = 1 << 1,
  ChargingDisplayRemaining = 1 << 2,
  ChargingDisplayIcon = 1 << 3,
  ChargingDisplayClock = 1 << 4,
  ChargingDisplayStock = 1 << 5,
};

typedef struct {
  uint8_t decimals;
  uint8_t seconds;
  uint8_t flags;
  uint8_t reserved;
} ChargingDisplayPrefs;

#define CHARGING_DISPLAY_DEFAULTS { .decimals = 3, .seconds = 3, .flags = 31 }

static inline ChargingDisplayPrefs charging_display_normalize(ChargingDisplayPrefs value) {
  if (value.decimals > 3) {
    value.decimals = 3;
  }
  if (value.seconds != 3 && value.seconds != 5 && value.seconds != 10 &&
      value.seconds != 30 && value.seconds != 60) {
    value.seconds = 3;
  }
  // Only the three supported screens are persisted; migrate old custom combinations.
  if (value.flags & ChargingDisplayStock) {
    value.flags = ChargingDisplayStock;
  } else if (value.flags != (ChargingDisplayIcon | ChargingDisplayPercent)) {
    value.flags = 31;
  }
  value.reserved = 0;
  return value;
}

ChargingDisplayPrefs shell_prefs_get_charging_display(void);
void shell_prefs_set_charging_display(ChargingDisplayPrefs value);

static inline void charging_display_format_percent(char *buffer, size_t size,
                                                    uint32_t mpct, uint8_t decimals) {
  unsigned digits = decimals > 3 ? 3 : decimals;
  if (mpct >= 100000 || digits == 0) {
    snprintf(buffer, size, "%lu%%", (unsigned long)(mpct >= 100000 ? 100 : mpct / 1000));
  } else {
    const uint16_t divisors[] = {1000, 100, 10, 1};
    snprintf(buffer, size, "%lu.%0*lu%%", (unsigned long)(mpct / 1000), (int)digits,
             (unsigned long)((mpct % 1000) / divisors[digits]));
  }
}
