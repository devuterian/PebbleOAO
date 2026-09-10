/* SPDX-License-Identifier: Apache-2.0 */
#pragma once
#include <stdbool.h>
#include <stdint.h>
typedef enum {
  KeySoundMenu,
  KeySoundNavigate,
  KeySoundSelect,
  KeySoundBack,
  KeySoundClose,
  KeySoundApply,
  KeySoundVolume,
  KeySoundBatteryLow,
  KeySoundDndOff,
  KeySoundCount
} KeySound;
typedef struct {
  uint8_t enabled, level, status_enabled, chime_level;
} KeySoundSettings;
#ifdef CONFIG_KEY_SOUNDS
void key_sounds_init(void);
void key_sounds_play(KeySound sound);
void key_sounds_preview(uint8_t level);
void key_sounds_preview_volume(uint8_t volume);
KeySoundSettings key_sounds_get_settings(void);
bool key_sounds_set_settings(KeySoundSettings settings);
uint8_t key_sounds_volume(uint8_t level);
#else
static inline void key_sounds_init(void) {}
static inline void key_sounds_play(KeySound sound) {}
static inline void key_sounds_preview(uint8_t level) {}
static inline uint8_t key_sounds_volume(uint8_t level) {
  return 100;
}
#endif
