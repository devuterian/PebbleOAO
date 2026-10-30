/* SPDX-FileCopyrightText: 2026 Core Devices LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#pragma once

//! Keeps the announced dark mode state current without polling: re-checks it when the dark mode
//! prefs change, at the start and end of the dark mode schedule, after clock changes and when
//! the backlight turns on. Ambient mode is otherwise sampled on demand by
//! \ref system_theme_is_dark_mode. Must be called after the shell prefs are initialized.
void dark_mode_updater_init(void);

//! Re-checks dark mode and reschedules the schedule edges. Call when the dark mode or its
//! schedule changes. Does nothing until \ref dark_mode_updater_init has run.
void dark_mode_updater_prefs_changed(void);

//! Call after the wall clock, time zone or DST changed.
void dark_mode_updater_handle_clock_change(void);

//! Call when the backlight turns on.
void dark_mode_updater_handle_backlight_on(void);
