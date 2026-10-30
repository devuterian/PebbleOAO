/* SPDX-FileCopyrightText: 2024 Google LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#include <stdint.h>

#include <pbl/kernel/compiler.h>

void PBL_WEAK light_enable_interaction(void) {
}

void PBL_WEAK light_flash(uint8_t count) {
}

void PBL_WEAK light_flash_cancel(void) {
}

void PBL_WEAK light_system_color_request(void) {
}

void PBL_WEAK light_system_color_release(void) {
}

void PBL_WEAK light_set_dark_threshold(uint32_t threshold) {
}

uint32_t PBL_WEAK light_get_ambient_gate_lux(void) {
  return 0;
}

uint32_t PBL_WEAK light_get_dark_threshold(void) {
  return 0;
}
