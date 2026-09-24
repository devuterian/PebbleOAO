/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */
#pragma once

#include <stdint.h>

// Prefer the gauge's full-charge model for CV taper; fall back to observed SOC gain.
static inline uint32_t charge_estimate_seconds(uint8_t target, uint32_t full_seconds,
                                               uint32_t start_cpct, uint32_t cpct,
                                               uint32_t elapsed) {
  if (target == 100 && full_seconds > 0 && full_seconds < 86400) {
    return full_seconds;
  }
  const uint32_t target_cpct = target * 100U;
  if (target > 100 || elapsed < 180 || cpct >= target_cpct || cpct <= start_cpct ||
      cpct - start_cpct < 100) {
    return 0;
  }
  uint64_t seconds = (uint64_t)(target_cpct - cpct) * elapsed / (cpct - start_cpct);
  return seconds < 86400 ? (uint32_t)seconds : 0;
}
