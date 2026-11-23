/* SPDX-FileCopyrightText: 2024 Google LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#include "vibe_patterns.h"

#include "option_menu.h"
#include "speaker_volume_window.h"
#include "window.h"
#include "pbl/services/speaker/key_sounds.h"

#include <stdio.h>
#include <string.h>

#include <pbl/i18n/i18n.h>
#include <pbl/kernel/fatal.h>
#include <pbl/logging/logging.h>
#include <pbl/services/notifications/alerts_preferences.h>
#include <pbl/services/notifications/alerts_preferences_private.h>
#include <pbl/services/speaker/speaker_service.h>
#include <pbl/services/vibes/vibe_client.h>
#include <pbl/services/vibes/vibe_intensity.h>
#include <pbl/services/vibes/vibe_score.h>
#include <pbl/services/vibes/vibe_score_info.h>
#include <pbl/util/string.h>

#include <applib/app_malloc.h>
#include <applib/ui/ui.h>

typedef enum VibeSettingsRow {
#ifdef CONFIG_SPEAKER
  VibeSettingsRow_MuteSpeaker = 0,
  VibeSettingsRow_SpeakerVolume,
#ifdef CONFIG_KEY_SOUNDS
  VibeSettingsRow_KeySounds,
  VibeSettingsRow_ChimeVolume,
#endif
  VibeSettingsRow_Notifications,
#else
  VibeSettingsRow_Notifications = 0,
#endif
  VibeSettingsRow_PhoneCalls,
  VibeSettingsRow_Alarms,
  VibeSettingsRow_Hourly,
  VibeSettingsRow_OnDisconnect,
  VibeSettingsRow_System,
  VibeSettingsRow_Count,
} VibeSettingsRow;

typedef struct SettingsVibePatternsData {
  SettingsCallbacks callbacks;
  unsigned int toggled_vibes_mask;
#ifdef CONFIG_SPEAKER
  char volume_subtitle[8]; // "100%" + NUL
#endif
} SettingsVibePatternsData;

#ifdef CONFIG_KEY_SOUNDS
static const char *s_levels[] = {"1", "2", "3", "4", "5"};

static void prv_level_focus(OptionMenu *menu, uint16_t new_row, uint16_t old_row, void *context) {
  const bool chime = (uintptr_t)settings_option_menu_get_context(context) != 0;
  if (chime) {
    key_sounds_preview_chime(new_row + 1);
  } else {
    key_sounds_preview(new_row + 1);
  }
}

static void prv_level_select(OptionMenu *menu, int selection, void *context) {
  const bool chime = (uintptr_t)settings_option_menu_get_context(context) != 0;
  KeySoundSettings settings = key_sounds_get_settings();
  if (chime) {
    settings.chime_level = selection + 1;
  } else {
    settings.level = selection + 1;
  }
  if (key_sounds_set_settings(settings)) {
    settings_menu_mark_dirty(SettingsMenuItemVibrations);
  }
}

static void prv_level_push(bool chime) {
  KeySoundSettings settings = key_sounds_get_settings();
  const OptionMenuCallbacks callbacks = {
      .select = prv_level_select, .selection_will_change = prv_level_focus};
  settings_option_menu_push(chime ? pbl_i18n_noop("Chime Volume") : pbl_i18n_noop("Key Volume"),
                            OptionMenuContentType_SingleLine,
                            (chime ? settings.chime_level : settings.level) - 1, &callbacks, 5,
                            true, s_levels, (void *)(uintptr_t)chime);
}

static void prv_keys_deinit(SettingsCallbacks *context) {
  pbl_i18n_free_all(context);
  app_free(context);
}

static uint16_t prv_keys_rows(SettingsCallbacks *context) {
  return 3;
}

static void prv_keys_draw(SettingsCallbacks *context, GContext *ctx, const Layer *cell,
                          uint16_t row, bool selected) {
  KeySoundSettings settings = key_sounds_get_settings();
  const char *titles[] = {pbl_i18n_noop("Key Sounds"), pbl_i18n_noop("Key Volume"),
                          pbl_i18n_noop("Status Sounds")};
  const char *subtitle = row == 1 ? s_levels[settings.level - 1]
                                  : pbl_i18n_get((row == 0 ? settings.enabled : settings.status_enabled)
                                                 ? pbl_i18n_noop("On")
                                                 : pbl_i18n_noop("Off"),
                                             context);
  menu_cell_basic_draw(ctx, cell, pbl_i18n_get(titles[row], context), subtitle, NULL);
}

static void prv_keys_select(SettingsCallbacks *context, uint16_t row) {
  if (row == 1) {
    prv_level_push(false);
    return;
  }
  KeySoundSettings settings = key_sounds_get_settings();
  if (row == 0) {
    settings.enabled = !settings.enabled;
  } else {
    settings.status_enabled = !settings.status_enabled;
  }
  if (key_sounds_set_settings(settings)) {
    key_sounds_play(KeySoundApply);
    settings_menu_mark_dirty(SettingsMenuItemVibrations);
  }
}

static void prv_keys_push(void) {
  SettingsCallbacks *callbacks = app_zalloc_check(sizeof(*callbacks));
  *callbacks = (SettingsCallbacks){
      .deinit = prv_keys_deinit,
      .draw_row = prv_keys_draw,
      .select_click = prv_keys_select,
      .num_rows = prv_keys_rows,
  };
  Window *window = settings_window_create_with_title(SettingsMenuItemVibrations,
                                                     pbl_i18n_noop("Key Sounds"), callbacks);
  app_window_stack_push(window, true);
}
#endif

static void prv_deinit_cb(SettingsCallbacks *context) {
  SettingsVibePatternsData *data = (SettingsVibePatternsData *)context;
  pbl_i18n_free_all(data);
  app_free(data);
}

static const char *prv_row_title(uint16_t row) {
  switch (row) {
    case VibeSettingsRow_Notifications:
      return pbl_i18n_noop("Notifications");
    case VibeSettingsRow_PhoneCalls:
      return pbl_i18n_noop("Incoming Calls");
    case VibeSettingsRow_Alarms:
      return pbl_i18n_noop("Alarms");
    case VibeSettingsRow_Hourly:
      return pbl_i18n_noop("Hourly Notice");
    case VibeSettingsRow_OnDisconnect:
      return pbl_i18n_noop("On Disconnect");
    case VibeSettingsRow_System:
      /// Refers to the class of all non-score vibes, e.g. 3rd party app vibes
      return pbl_i18n_noop("System");
    default:
      pbl_panic();
  }
}

static void prv_draw_row_cb(SettingsCallbacks *context, GContext *ctx, const Layer *cell_layer,
                            uint16_t row, bool selected) {
  SettingsVibePatternsData *data = (SettingsVibePatternsData *)context;

  const char *title = nullptr;
  const char *subtitle = nullptr;

  VibeClient client = VibeClient_Notifications;
  switch (row) {
#ifdef CONFIG_SPEAKER
    case VibeSettingsRow_MuteSpeaker: {
      title = pbl_i18n_noop("Mute Speaker");
      subtitle =
          alerts_preferences_get_speaker_muted() ? pbl_i18n_noop("On") : pbl_i18n_noop("Off");
      menu_cell_basic_draw(ctx, cell_layer, pbl_i18n_get(title, data), pbl_i18n_get(subtitle, data),
                           nullptr);
      return;
    }
    case VibeSettingsRow_SpeakerVolume: {
      title = pbl_i18n_noop("Volume");
      snprintf(data->volume_subtitle, sizeof(data->volume_subtitle), "%u%%",
               alerts_preferences_get_speaker_volume());
      menu_cell_basic_draw(ctx, cell_layer, pbl_i18n_get(title, data), data->volume_subtitle,
                           nullptr);
      return;
    }
#endif
#ifdef CONFIG_KEY_SOUNDS
    case VibeSettingsRow_KeySounds:
    case VibeSettingsRow_ChimeVolume: {
      KeySoundSettings settings = key_sounds_get_settings();
      const bool chime = row == VibeSettingsRow_ChimeVolume;
      title = chime ? pbl_i18n_noop("Chime Volume") : pbl_i18n_noop("Key Sounds");
      subtitle = chime ? s_levels[settings.chime_level - 1]
                       : pbl_i18n_get(settings.enabled ? pbl_i18n_noop("On") : pbl_i18n_noop("Off"), data);
      menu_cell_basic_draw(ctx, cell_layer, pbl_i18n_get(title, data), subtitle, NULL);
      return;
    }
#endif
    case VibeSettingsRow_Notifications: {
      client = VibeClient_Notifications;
      break;
    }
    case VibeSettingsRow_PhoneCalls: {
      client = VibeClient_PhoneCalls;
      break;
    }
    case VibeSettingsRow_Alarms: {
      client = VibeClient_Alarms;
      break;
    }
    case VibeSettingsRow_Hourly: {
      client = VibeClient_Hourly;
      break;
    }
    case VibeSettingsRow_OnDisconnect: {
      client = VibeClient_OnDisconnect;
      break;
    }
    case VibeSettingsRow_System: {
      const VibeIntensity current_system_default_vibe_intensity = vibe_intensity_get();
      subtitle = vibe_intensity_get_string_for_intensity(current_system_default_vibe_intensity);
      break;
    }
    default: {
      pbl_panic();
    }
  }

  title = prv_row_title(row);

  // We need to set the subtitle to the name of a vibe score if it's NULL at this point
  if (!subtitle) {
    subtitle = vibe_score_info_get_name(alerts_preferences_get_vibe_score_for_client(client));
    if (subtitle && PBL_IS_EMPTY_STRING(subtitle)) {
      subtitle = nullptr;
    }
  }
  menu_cell_basic_draw(ctx, cell_layer, pbl_i18n_get(title, data), pbl_i18n_get(subtitle, data),
                       nullptr);
}

static void prv_selection_changed_cb(SettingsCallbacks *context, uint16_t new_row,
                                     uint16_t old_row) {
  vibes_cancel();
  VibeScore *score;
  switch (new_row) {
#ifdef CONFIG_SPEAKER
    case VibeSettingsRow_MuteSpeaker:
#ifdef CONFIG_KEY_SOUNDS
    case VibeSettingsRow_KeySounds:
    case VibeSettingsRow_ChimeVolume:
#endif
    case VibeSettingsRow_SpeakerVolume: {
      // No vibe preview — this row controls a non-vibe setting.
      return;
    }
#endif
    case VibeSettingsRow_Notifications: {
      score = vibe_client_get_score(VibeClient_Notifications);
      break;
    }
    case VibeSettingsRow_PhoneCalls: {
      score = vibe_client_get_score(VibeClient_PhoneCalls);
      break;
    }
    case VibeSettingsRow_Alarms: {
      score = vibe_client_get_score(VibeClient_Alarms);
      break;
    }
    case VibeSettingsRow_Hourly: {
      score = vibe_client_get_score(VibeClient_Hourly);
      break;
    }
    case VibeSettingsRow_OnDisconnect: {
      score = vibe_client_get_score(VibeClient_OnDisconnect);
      break;
    }
    case VibeSettingsRow_System: {
      // Vibe a short pulse so the user can feel the current system default vibe intensity
      vibes_short_pulse();
      // Just return because the remainder of this function only applies to vibe scores
      return;
    }
    default:
      pbl_panic();
  }
  if (!score) {
    PBL_LOG_ERR("Null VibeScore!");
    return;
  }
  vibe_score_do_vibe(score);
  vibe_score_destroy(score);
}

// Vibe score menu
/////////////////////////////

typedef struct VibeScoreMenuData {
  VibeClient client;
  bool committed;
  VibeScoreId *ids;
  const char **names;
} VibeScoreMenuData;

static void prv_preview_score(VibeScoreId id) {
  vibes_cancel();
  if (id == VibeScoreId_Disabled) {
    return;
  }
  VibeScore *score = vibe_score_create_with_resource(vibe_score_info_get_resource_id(id));
  if (!score) {
    return;
  }
  vibe_score_do_vibe(score);
  vibe_score_destroy(score);
}

static void prv_score_menu_selection_will_change(OptionMenu *option_menu, uint16_t new_row,
                                                 uint16_t old_row, void *context) {
  VibeScoreMenuData *data = settings_option_menu_get_context(context);
  if (new_row != old_row) {
    prv_preview_score(data->ids[new_row]);
  }
}

static void prv_score_menu_select(OptionMenu *option_menu, int selection, void *context) {
  VibeScoreMenuData *data = settings_option_menu_get_context(context);
  data->committed = true;
  alerts_preferences_set_vibe_score_for_client(data->client, data->ids[selection]);
  settings_menu_mark_dirty(SettingsMenuItemVibrations);
  prv_preview_score(data->ids[selection]);
  app_window_stack_remove(&option_menu->window, true /* animated */);
}

static void prv_score_menu_unload(OptionMenu *option_menu, void *context) {
  VibeScoreMenuData *data = settings_option_menu_get_context(context);
  // Keep the confirmation vibe of a selection, stop a preview when backing out
  if (!data->committed) {
    vibes_cancel();
  }
  app_free(data->ids);
  app_free(data->names);
  app_free(data);
}

static void prv_score_menu_push(VibeClient client, const char *title) {
  const unsigned int num_scores = vibe_score_info_get_ids_for_client(client, nullptr, 0);
  if (num_scores == 0) {
    return;
  }

  VibeScoreMenuData *data = app_zalloc_check(sizeof(*data));
  data->client = client;
  data->ids = app_malloc_check(num_scores * sizeof(*data->ids));
  data->names = app_malloc_check(num_scores * sizeof(*data->names));
  vibe_score_info_get_ids_for_client(client, data->ids, num_scores);

  const VibeScoreId current = alerts_preferences_get_vibe_score_for_client(client);
  int choice = 0;
  for (unsigned int i = 0; i < num_scores; i++) {
    data->names[i] = vibe_score_info_get_name(data->ids[i]);
    if (data->ids[i] == current) {
      choice = i;
    }
  }

  const OptionMenuCallbacks callbacks = {
    .select = prv_score_menu_select,
    .selection_will_change = prv_score_menu_selection_will_change,
    .unload = prv_score_menu_unload,
  };
  settings_option_menu_push(title, OptionMenuContentType_SingleLine, choice, &callbacks, num_scores,
                            true /* icons_enabled */, data->names, data);
}

// System vibe intensity menu
/////////////////////////////

static const char *s_intensity_names[VibeIntensityNum];

static void prv_intensity_menu_selection_will_change(OptionMenu *option_menu, uint16_t new_row,
                                                     uint16_t old_row, void *context) {
  if (new_row != old_row) {
    // Apply the intensity until the menu closes so the user can feel it
    vibes_cancel();
    vibe_intensity_set(new_row);
    vibes_short_pulse();
  }
}

static void prv_intensity_menu_select(OptionMenu *option_menu, int selection, void *context) {
  alerts_preferences_set_vibe_intensity(selection);
  settings_menu_mark_dirty(SettingsMenuItemVibrations);
  vibes_cancel();
  vibe_intensity_set(selection);
  vibes_short_pulse();
  app_window_stack_remove(&option_menu->window, true /* animated */);
}

static void prv_intensity_menu_unload(OptionMenu *option_menu, void *context) {
  vibe_intensity_set(alerts_preferences_get_vibe_intensity());
}

static void prv_intensity_menu_push(const char *title) {
  for (int i = 0; i < VibeIntensityNum; i++) {
    s_intensity_names[i] = vibe_intensity_get_string_for_intensity(i);
  }
  const OptionMenuCallbacks callbacks = {
    .select = prv_intensity_menu_select,
    .selection_will_change = prv_intensity_menu_selection_will_change,
    .unload = prv_intensity_menu_unload,
  };
  settings_option_menu_push(title, OptionMenuContentType_SingleLine, vibe_intensity_get(),
                            &callbacks, VibeIntensityNum, true /* icons_enabled */,
                            s_intensity_names, nullptr);
}

static void prv_select_click_cb(SettingsCallbacks *context, uint16_t row) {
  vibes_cancel();

  VibeClient client;
  switch (row) {
#ifdef CONFIG_SPEAKER
    case VibeSettingsRow_MuteSpeaker: {
      const bool new_muted = !alerts_preferences_get_speaker_muted();
      alerts_preferences_set_speaker_muted(new_muted);
      speaker_service_handle_audio_prefs_changed();
      settings_menu_mark_dirty(SettingsMenuItemVibrations);
      return;
    }
    case VibeSettingsRow_SpeakerVolume: {
      speaker_volume_window_push();
      return;
    }
#endif
#ifdef CONFIG_KEY_SOUNDS
    case VibeSettingsRow_KeySounds:
      prv_keys_push();
      return;
    case VibeSettingsRow_ChimeVolume:
      prv_level_push(true);
      return;
#endif
    case VibeSettingsRow_Notifications: {
      client = VibeClient_Notifications;
      break;
    }
    case VibeSettingsRow_PhoneCalls: {
      client = VibeClient_PhoneCalls;
      break;
    }
    case VibeSettingsRow_Alarms: {
      client = VibeClient_Alarms;
      break;
    }
    case VibeSettingsRow_Hourly: {
      client = VibeClient_Hourly;
      break;
    }
    case VibeSettingsRow_OnDisconnect: {
      client = VibeClient_OnDisconnect;
      break;
    }
    case VibeSettingsRow_System: {
      prv_intensity_menu_push(prv_row_title(row));
      return;
    }
    default:
      pbl_panic();
  }

  prv_score_menu_push(client, prv_row_title(row));
}

static uint16_t prv_num_rows_cb(SettingsCallbacks *context) {
  return VibeSettingsRow_Count;
}

static void prv_expand_cb(SettingsCallbacks *context) {
  SettingsVibePatternsData *data = (SettingsVibePatternsData *)context;

  // window is visible again, remind user which vibe pattern they're on
  int16_t current_row = settings_menu_get_selected_row(SettingsMenuItemVibrations);
  prv_selection_changed_cb(&data->callbacks, current_row, 0);

  settings_menu_mark_dirty(SettingsMenuItemVibrations);
}

static void prv_hide_cb(SettingsCallbacks *context) {
  vibes_cancel();
}

static Window *prv_init(void) {
  SettingsVibePatternsData *data = app_zalloc_check(sizeof(SettingsVibePatternsData));

  data->callbacks = (SettingsCallbacks){
    .deinit = prv_deinit_cb,
    .draw_row = prv_draw_row_cb,
    .selection_changed = prv_selection_changed_cb,
    .select_click = prv_select_click_cb,
    .num_rows = prv_num_rows_cb,
    .expand = prv_expand_cb,
    .hide = prv_hide_cb,
  };

  return settings_window_create(SettingsMenuItemVibrations, &data->callbacks);
}

const SettingsModuleMetadata *settings_vibe_patterns_get_info(void) {
  static const SettingsModuleMetadata s_module_info = {
#ifdef CONFIG_SPEAKER
    .name = pbl_i18n_noop("Sounds & Haptics"),
#else
    .name = pbl_i18n_noop("Vibrations"),
#endif
    .init = prv_init,
  };

  return &s_module_info;
}
