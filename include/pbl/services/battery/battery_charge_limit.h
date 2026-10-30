/* SPDX-FileCopyrightText: 2026 Shashvat Prabhu */
/* SPDX-License-Identifier: Apache-2.0 */

#pragma once

#include "pbl/services/battery/battery_state.h"

// The battery charge limit service can stop charging at 80% or 90% to reduce battery
// degradation from sustained high charge levels.

void battery_charge_limit_init(void);

void battery_charge_limit_evaluate(PreciseBatteryChargeState state);

bool battery_charge_limit_is_active(void);

//! Ignore the configured limit until the currently connected charger is unplugged.
void battery_charge_limit_charge_once_to_full(void);
bool battery_charge_limit_is_once_to_full(void);

//! Queue an evaluation on KernelMain after the preference changes.
void battery_charge_limit_refresh(void);
//! Charge levels in millipercent where charging stops and resumes for the current limit,
//! cached so the fuel gauge can post an event right at those crossings.
uint32_t battery_charge_limit_get_stop_mpct(void);
uint32_t battery_charge_limit_get_resume_mpct(void);
