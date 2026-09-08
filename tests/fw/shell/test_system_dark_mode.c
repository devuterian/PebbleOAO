/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */

#include "clar.h"
#include "shell/system_theme.h"
#include "shell/prefs.h"
#include "process_management/pebble_process_md.h"
#include "kernel/pebble_tasks.h"
#include <time.h>
#include "stubs_analytics.h"
#include "stubs_fonts.h"
#include "stubs_logging.h"
#include "stubs_passert.h"
#include "stubs_process_manager.h"

static DarkMode s_mode;
static DarkModeSchedule s_schedule;
static bool s_light;
static int s_hour, s_minute;
static PebbleTask s_task;
static ProcessAppSDKType s_sdk;

DarkMode shell_prefs_get_dark_mode(void) { return s_mode; }
void shell_prefs_get_dark_mode_schedule(DarkModeSchedule *schedule) { *schedule = s_schedule; }
PreferredContentSize system_theme_get_content_size(void) { return PreferredContentSizeDefault; }
bool ambient_light_is_light(void) { return s_light; }
void rtc_get_time_tm(struct tm *value) { *value = (struct tm){ .tm_hour = s_hour, .tm_min = s_minute }; }
PebbleTask pebble_task_get_current(void) { return s_task; }
ProcessAppSDKType process_metadata_get_app_sdk_type(const PebbleProcessMd *md) { return s_sdk; }

void test_system_dark_mode__initialize(void) {
  s_mode = DarkModeOff;
  s_light = true;
  s_task = PebbleTask_KernelMain;
  s_sdk = ProcessAppSDKType_System;
  s_schedule = (DarkModeSchedule){ .from_hour = 19, .to_hour = 7 };
  s_hour = s_minute = 0;
}

void test_system_dark_mode__manual_and_ambient(void) {
  cl_assert(!system_theme_is_dark_mode());
  s_mode = DarkModeOn;
  cl_assert(system_theme_is_dark_mode());
  cl_assert_equal_i(system_theme_get_bg_color().argb, GColorBlack.argb);
  cl_assert_equal_i(system_theme_get_fg_color().argb, GColorWhite.argb);
  s_mode = DarkModeAmbient;
  cl_assert(!system_theme_is_dark_mode());
  s_light = false;
  cl_assert(system_theme_is_dark_mode());
}

void test_system_dark_mode__overnight_schedule_boundaries(void) {
  s_mode = DarkModeScheduled;
  s_hour = 18; s_minute = 59;
  cl_assert(!system_theme_is_dark_mode());
  s_hour = 19; s_minute = 0;
  cl_assert(system_theme_is_dark_mode());
  s_hour = 0;
  cl_assert(system_theme_is_dark_mode());
  s_hour = 7;
  cl_assert(!system_theme_is_dark_mode());
}

void test_system_dark_mode__equal_schedule_is_off(void) {
  s_mode = DarkModeScheduled;
  s_schedule.to_hour = s_schedule.from_hour;
  s_hour = 19;
  cl_assert(!system_theme_is_dark_mode());
}

void test_system_dark_mode__third_party_app_keeps_its_colors(void) {
  s_mode = DarkModeOn;
  s_task = PebbleTask_App;
  s_sdk = ProcessAppSDKType_Legacy3x;
  cl_assert(!system_theme_is_dark_mode());
  s_sdk = ProcessAppSDKType_System;
  cl_assert(system_theme_is_dark_mode());
}
