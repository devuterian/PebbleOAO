/* SPDX-License-Identifier: Apache-2.0 */
#include "pbl/services/speaker/key_sounds.h"
#include "pbl/services/speaker/speaker_service.h"
#include "pbl/services/settings/settings_file.h"
#include "pbl/services/system_task.h"
#include "pbl/services/firmware_update.h"
#include "pbl/services/notifications/do_not_disturb.h"
#include "pbl/kernel/mutex.h"
#include "kernel/low_power.h"
#include "process_management/process_manager.h"
#include "process_management/pebble_process_md.h"
#include "syscall/syscall.h"
#include "syscall/syscall_internal.h"
#include "resource/resource_ids.auto.h"

typedef struct {
  const int16_t *samples;
  uint32_t count;
} KeySoundSample;
#include "key_sounds_data.inc"
static PBL_MUTEX_DEFINE(s_lock);
static KeySoundSettings s_settings = {.level = 3, .chime_level = 5};
static bool s_queued;
static KeySound s_pending;
static int16_t s_preview_volume = -1;
static bool s_preview_absolute;

static bool prv_valid(KeySoundSettings v) {
  return v.enabled <= 1 && v.status_enabled <= 1 && v.level >= 1 && v.level <= 5 &&
         v.chime_level >= 1 && v.chime_level <= 5;
}
uint8_t key_sounds_volume(uint8_t level) {
  static const uint8_t levels[] = {10, 20, 35, 60, 100};
  return levels[(level >= 1 && level <= 5) ? level - 1 : 2];
}
void key_sounds_init(void) {
  SettingsFile file;
  if (settings_file_open(&file, "keysounds", 128) == S_SUCCESS) {
    KeySoundSettings saved;
    if (settings_file_get(&file, "settings", 8, &saved, sizeof(saved)) == S_SUCCESS &&
        prv_valid(saved)) {
      s_settings = saved;
    }
    settings_file_close(&file);
  }
}
KeySoundSettings key_sounds_get_settings(void) {
  pbl_mutex_lock(&s_lock, PBL_FOREVER);
  KeySoundSettings v = s_settings;
  pbl_mutex_unlock(&s_lock);
  return v;
}
bool key_sounds_set_settings(KeySoundSettings v) {
  if (!prv_valid(v)) {
    return false;
  }
  pbl_mutex_lock(&s_lock, PBL_FOREVER);
  SettingsFile file;
  bool saved = false;
  if (settings_file_open(&file, "keysounds", 128) == S_SUCCESS) {
    saved = settings_file_set(&file, "settings", 8, &v, sizeof(v)) == S_SUCCESS;
    settings_file_close(&file);
  }
  if (saved) {
    s_settings = v;
  }
  pbl_mutex_unlock(&s_lock);
  if (saved && !v.enabled) {
    speaker_service_stop_ui();
  }
  return saved;
}
static void prv_play(void *unused) {
  pbl_mutex_lock(&s_lock, PBL_FOREVER);
  KeySound sound = s_pending;
  int16_t preview = s_preview_volume;
  bool absolute = s_preview_absolute;
  KeySoundSettings settings = s_settings;
  s_queued = false;
  pbl_mutex_unlock(&s_lock);
  if ((preview < 0 &&
       (!settings.enabled || (sound >= KeySoundBatteryLow && !settings.status_enabled))) ||
      do_not_disturb_is_active() || low_power_is_active() || firmware_update_is_in_progress()) {
    return;
  }
  if (preview == 0) {
    speaker_service_stop_ui();
    return;
  }
  speaker_service_play_ui_pcm(s_samples[sound].samples, s_samples[sound].count,
                              preview >= 0 ? preview : key_sounds_volume(settings.level), absolute);
}
static void prv_queue(KeySound sound, int16_t preview, bool absolute) {
  pbl_mutex_lock(&s_lock, PBL_FOREVER);
  s_pending = sound;
  s_preview_volume = preview;
  s_preview_absolute = absolute;
  if (!s_queued && system_task_get_available_space() > 4) {
    s_queued = true;
    if (!system_task_add_callback(prv_play, NULL)) {
      s_queued = false;
    }
  }
  pbl_mutex_unlock(&s_lock);
}
DEFINE_SYSCALL(void, key_sounds_play, KeySound sound) {
  if ((unsigned)sound >= KeySoundCount) {
    return;
  }
  PebbleTask task = pebble_task_get_current();
  if ((task == PebbleTask_App || task == PebbleTask_Worker) &&
      process_metadata_get_app_sdk_type(sys_process_manager_get_current_process_md()) !=
          ProcessAppSDKType_System) {
    return;
  }
  KeySoundSettings settings = key_sounds_get_settings();
  if (!settings.enabled || (sound >= KeySoundBatteryLow && !settings.status_enabled)) {
    return;
  }
  prv_queue(sound, -1, false);
}
void key_sounds_preview(uint8_t level) {
  if (level >= 1 && level <= 5) {
    prv_queue(KeySoundVolume, key_sounds_volume(level), false);
  }
}

static void prv_preview_chime(void *context) {
  const uint8_t level = (uintptr_t)context;
  speaker_service_preview_chime_resource(RESOURCE_ID_HOURLY_CHIME, key_sounds_volume(level));
}

void key_sounds_preview_chime(uint8_t level) {
  if (level >= 1 && level <= 5) {
    system_task_add_callback(prv_preview_chime, (void *)(uintptr_t)level);
  }
}

void key_sounds_preview_volume(uint8_t volume) {
  if (volume <= 100) {
    prv_queue(KeySoundVolume, volume, true);
  }
}
