/* SPDX-License-Identifier: Apache-2.0 */
#include "clar.h"
#include "pbl/services/speaker/key_sounds.h"
#include "pbl/settings/settings.h"

#include "fake_settings.h"
#include <pbl/kernel/work.h>

static unsigned s_plays, s_stops;
static uint8_t s_last_volume;

void speaker_service_play_ui_pcm(const int16_t *samples, uint32_t count, uint8_t volume,
                                 bool absolute) {
  s_plays++;
  s_last_volume = volume;
}
bool speaker_service_preview_chime_resource(uint32_t id, uint8_t volume) {
  return true;
}
void speaker_service_stop_ui(void) {
  s_stops++;
}
bool do_not_disturb_is_active(void) {
  return false;
}
bool low_power_is_active(void) {
  return false;
}
bool firmware_update_is_in_progress(void) {
  return false;
}
size_t pbl_sys_work_num_free(void) {
  return 8;
}
bool pbl_sys_work_call(pbl_work_call_fn_t cb, void *data) {
  cb(data);
  return true;
}

static KeySoundSettings prv_settings(uint8_t enabled, uint8_t status_enabled) {
  return (KeySoundSettings){
      .enabled = enabled, .level = 3, .status_enabled = status_enabled, .chime_level = 5};
}

void test_key_sounds__initialize(void) {
  fake_settings_reset();
  s_plays = s_stops = 0;
  s_last_volume = 0;
  key_sounds_init();
}

void test_key_sounds__defaults_are_off(void) {
  const KeySoundSettings settings = key_sounds_get_settings();
  cl_assert_equal_i(settings.enabled, 0);
  cl_assert_equal_i(settings.status_enabled, 0);
  cl_assert_equal_i(settings.level, 3);
  cl_assert_equal_i(settings.chime_level, 5);
}

void test_key_sounds__toggles_are_saved_and_read_at_boot(void) {
  cl_assert(key_sounds_set_settings(prv_settings(1, 1)));
  cl_assert_equal_i(key_sounds_get_settings().enabled, 1);
  cl_assert_equal_i(key_sounds_get_settings().status_enabled, 1);

  KeySoundSettings volumes = prv_settings(1, 1);
  volumes.level = 5;
  volumes.chime_level = 2;
  cl_assert(key_sounds_set_settings(volumes));

  key_sounds_init();
  const KeySoundSettings saved = key_sounds_get_settings();
  cl_assert_equal_i(saved.enabled, 1);
  cl_assert_equal_i(saved.status_enabled, 1);
  cl_assert_equal_i(saved.level, 5);
  cl_assert_equal_i(saved.chime_level, 2);
}

void test_key_sounds__turning_off_stops_and_is_saved(void) {
  cl_assert(key_sounds_set_settings(prv_settings(1, 0)));
  cl_assert(key_sounds_set_settings(prv_settings(0, 0)));
  cl_assert_equal_i(s_stops, 1);
  key_sounds_init();
  cl_assert_equal_i(key_sounds_get_settings().enabled, 0);
}

void test_key_sounds__invalid_values_are_rejected(void) {
  KeySoundSettings settings = prv_settings(2, 0);
  cl_assert(!key_sounds_set_settings(settings));
  settings = prv_settings(1, 0);
  settings.level = 6;
  cl_assert(!key_sounds_set_settings(settings));
  settings.level = 3;
  settings.chime_level = 0;
  cl_assert(!key_sounds_set_settings(settings));
  cl_assert_equal_i(key_sounds_get_settings().enabled, 0);
}

void test_key_sounds__status_sounds_follow_their_own_toggle(void) {
  key_sounds_play(KeySoundBatteryLow);
  cl_assert_equal_i(s_plays, 0);

  cl_assert(key_sounds_set_settings(prv_settings(1, 0)));
  key_sounds_play(KeySoundSelect);
  cl_assert_equal_i(s_plays, 1);
  cl_assert_equal_i(s_last_volume, key_sounds_volume(3));
  key_sounds_play(KeySoundBatteryLow);
  cl_assert_equal_i(s_plays, 1);

  cl_assert(key_sounds_set_settings(prv_settings(1, 1)));
  key_sounds_play(KeySoundBatteryLow);
  cl_assert_equal_i(s_plays, 2);
}
