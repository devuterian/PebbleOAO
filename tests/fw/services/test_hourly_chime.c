/* SPDX-License-Identifier: Apache-2.0 */
#include "clar.h"
#include "pbl/services/hourly_chime.h"
#include "pbl/services/settings/settings_file.h"
#include "pbl/services/speaker/speaker_service.h"
#include "pbl/services/system_task.h"
#include "stubs_mutex.h"
#include <string.h>
#include <stdlib.h>

static time_t s_now;
static int s_timezone_hours;
struct tm *localtime_r(const time_t *epoch, struct tm *result) {
  const time_t local = *epoch + s_timezone_hours * 3600;
  *result = (struct tm){
      .tm_hour = (local / 3600) % 24, .tm_min = (local / 60) % 60, .tm_sec = local % 60};
  return result;
}
static bool s_dnd, s_muted, s_low_power, s_updating, s_has_saved, s_write_fails;
static uint8_t s_volume;
static SpeakerState s_speaker_state;
static HourlyChimeSettings s_saved;
static SystemTaskEventCallback s_pending;
static void *s_context;
static unsigned s_plays, s_queued, s_writes;

time_t rtc_get_time(void) {
  return s_now;
}
bool do_not_disturb_is_active(void) {
  return s_dnd;
}
bool low_power_is_active(void) {
  return s_low_power;
}
bool firmware_update_is_in_progress(void) {
  return s_updating;
}
bool speaker_service_is_muted(void) {
  return s_muted;
}
uint8_t alerts_preferences_get_speaker_volume(void) {
  return s_volume;
}
SpeakerState speaker_service_get_state(void) {
  return s_speaker_state;
}
bool speaker_service_play_chime_resource(uint32_t id) {
  s_plays++;
  return true;
}
bool system_task_add_callback(SystemTaskEventCallback cb, void *data) {
  cl_assert(!s_pending);
  s_pending = cb;
  s_context = data;
  s_queued++;
  return true;
}
status_t settings_file_open(SettingsFile *file, const char *name, int max) {
  return S_SUCCESS;
}
void settings_file_close(SettingsFile *file) {}
status_t settings_file_get(SettingsFile *file, const void *key, size_t keylen, void *value,
                           size_t size) {
  if (!s_has_saved) {
    return E_DOES_NOT_EXIST;
  }
  memcpy(value, &s_saved, size);
  return S_SUCCESS;
}
status_t settings_file_set(SettingsFile *file, const void *key, size_t keylen, const void *value,
                           size_t size) {
  if (s_write_fails) {
    return E_INTERNAL;
  }
  memcpy(&s_saved, value, size);
  s_has_saved = true;
  s_writes++;
  return S_SUCCESS;
}
static void prv_drain(void) {
  if (s_pending) {
    SystemTaskEventCallback cb = s_pending;
    s_pending = NULL;
    cb(s_context);
  }
}
static void prv_tick(int hour, int minute, int second) {
  s_now = 1704067200 + hour * 3600 + minute * 60 + second;  // 2024-01-01 UTC
  hourly_chime_tick(s_now);
  prv_drain();
}
void test_hourly_chime__initialize(void) {
  s_timezone_hours = 0;
  s_dnd = s_muted = s_low_power = s_updating = s_has_saved = s_write_fails = false;
  s_volume = 100;
  s_speaker_state = SpeakerStateIdle;
  s_pending = NULL;
  s_plays = s_queued = s_writes = 0;
  hourly_chime_init();
}
void test_hourly_chime__default_boundaries_and_no_polling_or_writes(void) {
  for (int minute = 0; minute < 1440; minute++) {
    prv_tick(minute / 60, minute % 60, 0);
  }
  cl_assert_equal_i(s_plays, 14);  // 10:00 through 23:00, midnight excluded.
  cl_assert_equal_i(s_queued, 14);
  cl_assert_equal_i(s_writes, 0);
}
void test_hourly_chime__half_hour_and_overnight(void) {
  HourlyChimeSettings settings = {
      .start_minute = 22 * 60, .end_minute = 2 * 60, .interval_minutes = 30, .enabled = 1};
  cl_assert(hourly_chime_set_settings(&settings));
  for (int minute = 0; minute < 1440; minute++) {
    prv_tick(minute / 60, minute % 60, 0);
  }
  cl_assert_equal_i(s_plays, 8);
  cl_assert_equal_i(s_writes, 1);
}
void test_hourly_chime__dnd_mute_zero_volume_low_power_update_and_busy(void) {
  s_dnd = true;
  prv_tick(10, 0, 0);
  s_dnd = false;
  s_muted = true;
  prv_tick(11, 0, 0);
  s_muted = false;
  s_volume = 0;
  prv_tick(12, 0, 0);
  s_volume = 100;
  s_low_power = true;
  prv_tick(13, 0, 0);
  s_low_power = false;
  s_updating = true;
  prv_tick(14, 0, 0);
  s_updating = false;
  s_speaker_state = SpeakerStatePlaying;
  prv_tick(15, 0, 0);
  cl_assert_equal_i(s_plays, 0);
}
void test_hourly_chime__late_and_duplicate_callbacks(void) {
  prv_tick(10, 0, 0);
  prv_tick(10, 0, 1);
  prv_tick(10, 0, 4);
  prv_tick(11, 0, 5);
  prv_tick(12, 0, 59);
  cl_assert_equal_i(s_plays, 1);
  cl_assert_equal_i(s_queued, 1);
}
void test_hourly_chime__rechecks_dnd_disabled_and_clock_change_after_queue(void) {
  s_now = 1704103200;
  hourly_chime_tick(s_now);
  s_dnd = true;
  prv_drain();
  s_dnd = false;
  s_now += 3600;
  hourly_chime_tick(s_now);
  s_now += 60;
  prv_drain();
  s_now += 3540;
  hourly_chime_tick(s_now);
  HourlyChimeSettings settings = hourly_chime_get_settings();
  settings.enabled = 0;
  cl_assert(hourly_chime_set_settings(&settings));
  prv_drain();
  cl_assert_equal_i(s_plays, 0);
  prv_tick(13, 0, 0);
  cl_assert_equal_i(s_queued, 3);
}
void test_hourly_chime__persistence_validation_and_write_failure(void) {
  HourlyChimeSettings settings = hourly_chime_get_settings();
  settings.interval_minutes = 30;
  cl_assert(hourly_chime_set_settings(&settings));
  hourly_chime_init();
  cl_assert_equal_i(hourly_chime_get_settings().interval_minutes, 30);
  s_write_fails = true;
  settings.enabled = 0;
  cl_assert(!hourly_chime_set_settings(&settings));
  cl_assert_equal_i(hourly_chime_get_settings().enabled, 1);
  s_write_fails = false;
  settings.start_minute = 1440;
  cl_assert(!hourly_chime_set_settings(&settings));
  s_saved.interval_minutes = 0;
  hourly_chime_init();
  cl_assert_equal_i(hourly_chime_get_settings().interval_minutes, 60);
}
void test_hourly_chime__local_timezone_and_equal_endpoints(void) {
  s_timezone_hours = 9;
  HourlyChimeSettings settings = hourly_chime_get_settings();
  prv_tick(1, 0, 0);  // 10:00 in Korea.
  cl_assert_equal_i(s_plays, 1);
  settings.start_minute = settings.end_minute = 0;
  cl_assert(hourly_chime_set_settings(&settings));
  prv_tick(15, 0, 0);  // Midnight in Korea, all-day schedule.
  cl_assert_equal_i(s_plays, 2);
}
