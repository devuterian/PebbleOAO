# SPDX-FileCopyrightText: 2026 Core Devices LLC
# SPDX-License-Identifier: Apache-2.0

pbl_clar_test(test_system_theme
  SOURCES
    pebble/shell/system_theme.c
    pebble/shell/system_theme_style.c
)

pbl_clar_test(test_system_dark_mode
  SOURCES
    pebble/shell/system_theme.c
    pebble/shell/system_theme_style.c
  PLATFORMS emery
  DEFINES CONFIG_BACKLIGHT_HAS_COLOR=1
)

pbl_clar_test(test_charging_preferences)
