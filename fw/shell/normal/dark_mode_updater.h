/* SPDX-FileCopyrightText: 2026 Core Devices LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#pragma once

//! Keeps the announced dark mode state current without polling: re-checks it when the dark mode
//! prefs change and at the start and end of the dark mode schedule. Ambient mode is sampled on
//! demand by \ref system_theme_is_dark_mode instead. Must be called after the shell prefs are
//! initialized.
void dark_mode_updater_init(void);

//! Re-checks dark mode and reschedules the schedule edges. Call when the dark mode or its
//! schedule changes. Does nothing until \ref dark_mode_updater_init has run.
void dark_mode_updater_prefs_changed(void);
