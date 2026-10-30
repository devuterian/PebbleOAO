/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */

#include "clar.h"
#include "shell/system_theme.h"
#include "shell/prefs.h"
#include "process_management/pebble_process_md.h"
#include "kernel/events.h"
#include "kernel/pebble_tasks.h"
#include <pbl/drivers/rtc.h>
#include "stubs_fonts.h"
#include "stubs_logging.h"

static DarkMode s_mode;
static DarkModeSchedule s_schedule;
static bool s_light;
static int s_hour, s_minute;
static PebbleTask s_task;
static ProcessAppSDKType s_sdk;
static RtcTicks s_ticks;
static int s_dark_mode_events;

DarkMode shell_prefs_get_dark_mode(void) { return s_mode; }
void shell_prefs_get_dark_mode_schedule(DarkModeSchedule *schedule) { *schedule = s_schedule; }
PreferredContentSize system_theme_get_content_size(void) { return PreferredContentSizeDefault; }
uint32_t light_get_ambient_gate_lux(void) { return s_light ? 100 : 0; }
uint32_t light_get_dark_threshold(void) { return 10; }
RtcTicks rtc_get_ticks(void) { return s_ticks; }
void rtc_get_time_tm(struct pbl_tm *value) {
  *value = (struct pbl_tm){ .tm_hour = s_hour, .tm_min = s_minute };
}
PebbleTask pebble_task_get_current(void) { return s_task; }
ProcessAppSDKType process_metadata_get_app_sdk_type(const PebbleProcessMd *md) { return s_sdk; }
void event_put(PebbleEvent *event) {
  if (event->type == PEBBLE_DARK_MODE_CHANGE_EVENT) {
    s_dark_mode_events++;
  }
}

void test_system_dark_mode__initialize(void) {
  s_mode = DarkModeOff;
  s_light = true;
  s_task = PebbleTask_KernelMain;
  s_sdk = ProcessAppSDKType_System;
  s_schedule = (DarkModeSchedule){ .from_hour = 19, .to_hour = 7 };
  s_hour = s_minute = 0;
  // Expire the ambient light cache left by the previous test.
  s_ticks += 3600 * RTC_TICKS_HZ;
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
  s_ticks += 30 * RTC_TICKS_HZ;
  cl_assert(system_theme_is_dark_mode());
}

void test_system_dark_mode__ambient_reading_is_cached(void) {
  s_mode = DarkModeAmbient;
  cl_assert(!system_theme_is_dark_mode());
  s_light = false;
  s_ticks += 30 * RTC_TICKS_HZ - 1;
  cl_assert(!system_theme_is_dark_mode());
  s_ticks += 1;
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

void test_system_dark_mode__check_announces_each_flip_once(void) {
  // Settle the state announced by earlier tests
  system_theme_request_dark_mode_check();
  s_dark_mode_events = 0;
  s_mode = DarkModeOn;
  system_theme_request_dark_mode_check();
  cl_assert_equal_i(s_dark_mode_events, 1);
  system_theme_request_dark_mode_check();
  cl_assert_equal_i(s_dark_mode_events, 1);
  s_mode = DarkModeOff;
  system_theme_request_dark_mode_check();
  cl_assert_equal_i(s_dark_mode_events, 2);
}

void test_system_dark_mode__ambient_flip_is_announced_from_the_sample(void) {
  s_mode = DarkModeAmbient;
  system_theme_request_dark_mode_check();
  s_dark_mode_events = 0;
  s_light = false;
  s_ticks += 30 * RTC_TICKS_HZ;
  // Drawing with a stale sample asks for a new one, which announces the flip
  cl_assert(system_theme_is_dark_mode());
  cl_assert_equal_i(s_dark_mode_events, 1);
}
