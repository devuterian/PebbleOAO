# SPDX-FileCopyrightText: 2026 Core Devices LLC
# SPDX-License-Identifier: Apache-2.0

pbl_clar_test(test_system_theme
  SOURCES
    fw/shell/system_theme.c
    fw/shell/system_theme_style.c
)

pbl_clar_test(test_system_dark_mode
  SOURCES
    fw/shell/system_theme.c
    fw/shell/system_theme_style.c
  PLATFORMS emery
)

pbl_clar_test(test_charging_preferences)
