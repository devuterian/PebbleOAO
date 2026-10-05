/* SPDX-FileCopyrightText: 2024 Google LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#pragma once

#include "pbl/kernel/compiler.h"

#include <stdint.h>

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
