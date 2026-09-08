/* SPDX-License-Identifier: Apache-2.0 */
#pragma once

#include <stdbool.h>
#include <stdint.h>
#include <time.h>

typedef struct {
  uint16_t start_minute;  // Inclusive local minute of day.
  uint16_t end_minute;    // Exclusive; equal endpoints mean all day.
  uint8_t interval_minutes;
  uint8_t enabled;
} HourlyChimeSettings;

void hourly_chime_init(void);
HourlyChimeSettings hourly_chime_get_settings(void);
bool hourly_chime_set_settings(const HourlyChimeSettings *settings);
// Called by the existing clock minute callback, after boot services are ready.
void hourly_chime_tick(time_t now);
