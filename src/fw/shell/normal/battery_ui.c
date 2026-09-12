/* SPDX-FileCopyrightText: 2024 Google LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#include "pbl/services/speaker/key_sounds.h"

#include "battery_ui.h"

#include <stdint.h>
#include <stdio.h>

#include "applib/ui/dialogs/dialog_private.h"
#include "applib/ui/dialogs/simple_dialog.h"
#include "applib/ui/ui.h"
#include "kernel/ui/kernel_ui.h"
#include "kernel/ui/modals/modal_manager.h"
#include "resource/resource_ids.auto.h"
#include "pbl/services/battery/battery_curve.h"
#include "pbl/services/clock.h"
#include "pbl/services/i18n/i18n.h"
#include "util/time/time.h"
#include "pbl/services/battery/battery_charge_limit.h"
#include "shell/prefs.h"
#include "shell/charging_preferences.h"
#include <string.h>
#include "applib/fonts/fonts.h"
#include "applib/ui/kino/kino_reel_pdci.h"
#include "applib/ui/kino/kino_reel_pdcs.h"
#include "applib/graphics/gdraw_command_transforms.h"

#if defined(CONFIG_BOARD_OBELIX) || defined(CONFIG_BOARD_QEMU_EMERY)
#define CHARGE_DETAILS 1
static TimerID s_charge_timer = TIMER_INVALID_ID;
static bool s_charge_dialog;
static char s_charge_percent[16];
static char s_charge_detail[140];
static void prv_update_ui_charging(Dialog *dialog, void *ignored);

static void prv_charge_draw(Layer *layer, GContext *ctx) {
  ChargingDisplayPrefs prefs = shell_prefs_get_charging_display();
  GRect bounds = layer->bounds;
  graphics_context_set_fill_color(ctx, layer_get_window(layer)->background_color);
  graphics_fill_rect(ctx, &bounds);
  graphics_context_set_text_color(ctx, ((TextLayer *)layer)->text_color);
  if (prefs.flags & ChargingDisplayStock) {
    return;
  }
  // Visible glyph tops from the user's 200x228 layout; BITHAM starts 13px below its box.
  int y = prefs.flags == 31 ? 111 : 134;
  if (prefs.flags & ChargingDisplayPercent) {
    char integer[16], fraction[16] = "";
    snprintf(integer, sizeof(integer), "%s", s_charge_percent);
    char *dot = strchr(integer, '.');
    if (dot) {
      snprintf(fraction, sizeof(fraction), "%s", dot);
      *dot = '\0';
    }
    GFont large = fonts_get_system_font(FONT_KEY_BITHAM_42_BOLD);
    GFont small = fonts_get_system_font(FONT_KEY_BITHAM_30_BLACK);
    GRect measure = GRect(0, 0, 1000, 60);
    int width = graphics_text_layout_get_max_used_size(ctx, integer, large, measure,
        GTextOverflowModeTrailingEllipsis, GTextAlignmentLeft, NULL).w;
    int fraction_width = fraction[0] ? graphics_text_layout_get_max_used_size(ctx, fraction,
        small, measure, GTextOverflowModeTrailingEllipsis, GTextAlignmentLeft, NULL).w : 0;
    int x = (bounds.size.w - width - fraction_width) / 2;
    graphics_draw_text(ctx, integer, large, GRect(x, y, width + 1, 60),
                       GTextOverflowModeTrailingEllipsis, GTextAlignmentLeft, NULL);
    if (fraction[0]) {
      graphics_draw_text(ctx, fraction, small, GRect(x + width, y + 12, fraction_width + 1, 45),
                         GTextOverflowModeTrailingEllipsis, GTextAlignmentLeft, NULL);
    }
  }
  if (prefs.flags == 31) {
    graphics_draw_text(ctx, s_charge_detail, fonts_get_system_font(FONT_KEY_GOTHIC_18),
                       GRect(4, 158, bounds.size.w - 8, 28),
                       GTextOverflowModeTrailingEllipsis, GTextAlignmentCenter, NULL);
  }
  if (prefs.flags & ChargingDisplayClock) {
    char time[64];
    clock_copy_time_string(time, sizeof(time));
    graphics_draw_text(ctx, time, fonts_get_system_font(FONT_KEY_GOTHIC_24_BOLD),
                       GRect(4, 188, bounds.size.w - 8, 32),
                       GTextOverflowModeTrailingEllipsis, GTextAlignmentCenter, NULL);
  }
}

static void prv_charge_icon_layout(Dialog *dialog) {
  ChargingDisplayPrefs prefs = shell_prefs_get_charging_display();
  Layer *icon = &dialog->icon_layer.layer;
  // Match the 100px icon in the 200x228 charging layout. Scale each reel only once.
  KinoReel *reel = kino_layer_get_reel(&dialog->icon_layer);
  GSize size = GSize(100, 100);
  KinoReel *scaled_reel = NULL;
  GDrawCommandSequence *sequence = kino_reel_get_gdraw_command_sequence(reel);
  if (sequence && gdraw_command_sequence_get_bounds_size(sequence).w != size.w) {
    // Built-in draw commands may live in read-only flash.
    GDrawCommandSequence *copy = gdraw_command_sequence_clone(sequence);
    if (copy) {
      GSize from = gdraw_command_sequence_get_bounds_size(copy);
      for (uint32_t i = 0; i < gdraw_command_sequence_get_num_frames(copy); ++i) {
        GDrawCommandFrame *frame = gdraw_command_sequence_get_frame_by_index(copy, i);
        gdraw_command_list_scale(gdraw_command_frame_get_command_list(frame), from, size);
      }
      gdraw_command_sequence_set_bounds_size(copy, size);
      if (dialog->icon_id == RESOURCE_ID_BATTERY_ICON_CHARGING_LARGE) {
        gdraw_command_sequence_set_play_count(copy, PLAY_COUNT_INFINITE);
      }
      scaled_reel = kino_reel_pdcs_create(copy, true);
      if (!scaled_reel) {
        gdraw_command_sequence_destroy(copy);
      }
    }
  }
  GDrawCommandImage *image = kino_reel_get_gdraw_command_image(reel);
  if (image && gdraw_command_image_get_bounds_size(image).w != size.w) {
    GDrawCommandImage *copy = gdraw_command_image_clone(image);
    if (copy) {
      gdraw_command_image_scale(copy, size);
      scaled_reel = kino_reel_pdci_create(copy, true);
      if (!scaled_reel) {
        gdraw_command_image_destroy(copy);
      }
    }
  }
  if (scaled_reel) {
    kino_layer_set_reel(&dialog->icon_layer, scaled_reel, true);
    if (window_is_on_screen(&dialog->window)) {
      kino_layer_play(&dialog->icon_layer);
    }
  }
  GRect frame = GRect(0, 0, size.w, size.h);
  frame.origin.x = prefs.flags == 31 ? 51 : 50;
  frame.origin.y = prefs.flags == 31 ? 11 : 32;
  layer_set_frame(icon, &frame);
}

static void prv_charge_disappear(Window *window) {
  SimpleDialog *simple_dialog = window_get_user_data(window);
  kino_layer_pause(&simple_dialog_get_dialog(simple_dialog)->icon_layer);
}

static void prv_charge_load(void *context) {
  Dialog *dialog = context;
  if (!s_charge_dialog) {
    return;
  }
  layer_set_frame(&dialog->text_layer.layer, &dialog->window.layer.bounds);
  layer_set_update_proc(&dialog->text_layer.layer, prv_charge_draw);
  prv_charge_icon_layout(dialog);
  WindowHandlers handlers = dialog->window.window_handlers;
  handlers.disappear = prv_charge_disappear;
  window_set_window_handlers(&dialog->window, &handlers);
}
static void prv_charge_refresh(void *unused);
#endif

typedef void (*DialogUpdateFn)(Dialog *, void *);

static Dialog *s_dialog = NULL;

typedef struct {
  uint32_t percent;
  GColor background_color;
  ResourceId warning_icon;
} BatteryWarningDisplayData;

// UI Callbacks
///////////////////////

static const GColor s_warning_color[] = {
  { .argb = GColorLightGrayARGB8 },
  { .argb = GColorRedARGB8 },
};

static const ResourceId s_warning_icon[] = {
  RESOURCE_ID_BATTERY_ICON_LOW_LARGE,
  RESOURCE_ID_BATTERY_ICON_VERY_LOW_LARGE
};

static void prv_update_ui_fully_charged(Dialog *dialog, void *ignored) {
#if CHARGE_DETAILS
  if (shell_prefs_get_charging_display().flags != ChargingDisplayStock) {
    prv_update_ui_charging(dialog, NULL);
    return;
  }
#endif
  dialog_set_text(dialog, i18n_get("Fully Charged", dialog));
  dialog_set_background_color(dialog, GColorKellyGreen);
  dialog_set_icon(dialog, RESOURCE_ID_BATTERY_ICON_FULL_LARGE);
}

static void prv_update_ui_charging(Dialog *dialog, void *ignored) {
#if CHARGE_DETAILS
  if (shell_prefs_get_charging_display().flags == ChargingDisplayStock) {
    dialog_set_text(dialog, i18n_get("Charging", dialog));
    dialog_set_background_color(dialog, GColorLightGray);
    dialog_set_icon(dialog, RESOURCE_ID_BATTERY_ICON_CHARGING_LARGE);
    return;
  }
  BatteryChargeState state = battery_get_charge_state();
  bool limited = shell_prefs_get_charge_limit_enabled() &&
                 !battery_charge_limit_is_once_to_full();
  uint8_t target = limited ? shell_prefs_get_charge_limit_percent() : 100;
  ChargingDisplayPrefs prefs = shell_prefs_get_charging_display();
  uint32_t mpct = battery_state_get_millipercent();
  charging_display_format_percent(s_charge_percent, sizeof(s_charge_percent), mpct,
                                  prefs.decimals);
  const char *status = NULL;
  bool complete = state.is_plugged && mpct >= target * 1000U;
  if (complete) {
    status = i18n_get("Charge complete!", dialog);
  } else if (state.is_plugged && limited && battery_charge_limit_is_active()) {
    status = i18n_get("Cruising after a full charge", dialog);
  }
  if (status) {
    snprintf(s_charge_detail, sizeof(s_charge_detail), "%s", status);
  } else {
    uint32_t mw = 0, seconds = 0;
    bool valid = state.is_charging && battery_state_get_charge_estimate(target, &mw, &seconds);
    char power[24], duration[80];
    if (valid) {
      snprintf(power, sizeof(power), "%lu.%02luW", (unsigned long)(mw / 1000),
               (unsigned long)((mw % 1000) / 10));
    } else {
      snprintf(power, sizeof(power), "--W");
    }
    if (valid && seconds > 0 && seconds < 86400) {
      unsigned long minutes = (seconds + 59) / 60;
      if (minutes >= 60) {
        snprintf(duration, sizeof(duration), i18n_get("%luh %lum left", dialog),
                 minutes / 60, minutes % 60);
      } else {
        snprintf(duration, sizeof(duration), i18n_get("%lum left", dialog), minutes);
      }
    } else {
      snprintf(duration, sizeof(duration), "%s", i18n_get("Calculating", dialog));
    }
    bool show_power = prefs.flags & ChargingDisplayPower;
    bool show_time = prefs.flags & ChargingDisplayRemaining;
    if (show_power && show_time) {
      snprintf(s_charge_detail, sizeof(s_charge_detail), "%s / %s", power, duration);
    } else {
      snprintf(s_charge_detail, sizeof(s_charge_detail), "%s",
               show_power ? power : (show_time ? duration : ""));
    }
  }
  dialog_set_background_color(dialog, status ? GColorKellyGreen : system_theme_get_bg_color());
  dialog_set_text_color(dialog, status ? GColorBlack : system_theme_get_fg_color());
  uint32_t icon = status ? RESOURCE_ID_BATTERY_ICON_FULL_LARGE :
                           RESOURCE_ID_BATTERY_ICON_CHARGING_LARGE;
  if (dialog->icon_id != icon) {
    dialog_set_icon(dialog, icon);
  }
  if (window_is_loaded(&dialog->window)) {
    prv_charge_icon_layout(dialog);
  }
  if (!dialog->buffer) {
    dialog_set_text_buffer(dialog, "", false);
  }
  layer_mark_dirty(&dialog->text_layer.layer);
  return;
#else
  dialog_set_text(dialog, i18n_get("Charging", dialog));
#endif
  dialog_set_background_color(dialog, GColorLightGray);
  dialog_set_icon(dialog, RESOURCE_ID_BATTERY_ICON_CHARGING_LARGE);
}

static void prv_update_ui_warning(Dialog *dialog, void *context) {
  const BatteryWarningDisplayData *data = context;
  const uint32_t percent = data->percent;
  dialog_set_background_color(dialog, data->background_color);
  const size_t warning_length = 64;
  char buffer[warning_length];
  const uint32_t battery_hours_left = battery_curve_get_hours_remaining(percent);
  const char *message = clock_get_relative_daypart_string(rtc_get_time(), battery_hours_left);

  if (message) {
    snprintf(buffer, warning_length, i18n_get("Powered 'til %s", dialog),
             i18n_get(message, dialog));
    dialog_set_text(dialog, buffer);
  }

  dialog_set_icon(dialog, data->warning_icon);
}

#if CHARGE_DETAILS
static void prv_charge_refresh(void *unused) {
  if (!s_dialog || !s_charge_dialog) {
    return;
  }
  if (!battery_get_charge_state().is_plugged) {
    return;
  }
  if (window_is_on_screen(&s_dialog->window)) {
    ChargingDisplayPrefs prefs = shell_prefs_get_charging_display();
    if (!(prefs.flags & ChargingDisplayStock) &&
        (prefs.flags & (ChargingDisplayPercent | ChargingDisplayPower | ChargingDisplayRemaining))) {
      battery_state_request_sample();
    }
    prv_update_ui_charging(s_dialog, NULL);
  }
  new_timer_start(s_charge_timer, shell_prefs_get_charging_display().seconds * 1000U,
                  prv_charge_refresh, NULL, 0);
}
#endif

static void prv_dialog_on_unload(void *context) {
  Dialog *dialog = context;
  i18n_free_all(dialog);
  if (dialog == s_dialog) {
    s_dialog = NULL;
#if CHARGE_DETAILS
    s_charge_dialog = false;
    if (s_charge_timer != TIMER_INVALID_ID) {
      new_timer_stop(s_charge_timer);
    }
#endif
  }
}

static void prv_display_modal(WindowStack *stack, DialogUpdateFn update_fn, void *data) {
  if (s_dialog) {
    update_fn(s_dialog, data);
    return;
  }

  SimpleDialog *new_simple_dialog = simple_dialog_create(
      WINDOW_NAME("Battery Status"));

#if CHARGE_DETAILS
  if (s_charge_dialog) {
    // Keep the PDC reel's animation without the stock entrance transform.
    simple_dialog_set_icon_animated(new_simple_dialog, false);
  }
#endif
  Dialog *new_dialog = simple_dialog_get_dialog(new_simple_dialog);
  dialog_set_callbacks(new_dialog, &(DialogCallbacks) {
    .unload = prv_dialog_on_unload,
#if CHARGE_DETAILS
    .load = prv_charge_load,
#endif
  }, new_dialog);
  update_fn(new_dialog, data);

  Dialog *old_dialog = s_dialog;
  s_dialog = new_dialog;
  simple_dialog_push(new_simple_dialog, stack);

#if PBL_ROUND
  // For circular display, to fit some battery_ui messages requires 3 lines
  // Simple dialog only allows up to 2 lines, so adjust here
  // This has to occur after the dialog push has been called
  TextLayer *text_layer = &new_simple_dialog->dialog.text_layer;
  GContext *ctx = graphics_context_get_current_context();
  const int font_height = fonts_get_font_height(text_layer->font);
  const int text_cap_height = fonts_get_font_cap_offset(text_layer->font);
  const int max_text_height = 2 * font_height + text_cap_height;
  const int32_t text_height = text_layer_get_content_size(ctx, text_layer).h;
  if (text_height > max_text_height) {
    // Values used below were to improve visual aesthetics and were reviewed by design
    const int num_lines = 3;
    const int line_spacing_delta = -4;
    const int text_shift_y = -2;
    const int text_box_height = (font_height + text_cap_height) * num_lines +
                                line_spacing_delta * (num_lines - 1);
    const int text_flow_inset = 6;  // Modify to allow longer central lines
    text_layer_enable_screen_text_flow_and_paging(text_layer, text_flow_inset);
    text_layer_set_size(text_layer, GSize(DISP_COLS, text_box_height));
    text_layer->layer.frame.origin.y += text_shift_y;
    text_layer_set_line_spacing_delta(text_layer, line_spacing_delta);
  }
#endif

  if (old_dialog) {
    dialog_pop(old_dialog);
  }
}

// Public API
////////////////////

void battery_ui_display_plugged(void) {
#if CHARGE_DETAILS
  bool custom = shell_prefs_get_charging_display().flags != ChargingDisplayStock;
  if (s_dialog && s_charge_dialog != custom) {
    battery_ui_dismiss_modal();
  }
  s_charge_dialog = custom;
#endif
  // If we're plugged in for charging, we want to alert the user of this,
  // but we don't want to overlay ourselves over anything they may have
  // on the screen at the moment.
  WindowStack *stack = modal_manager_get_window_stack(ModalPriorityGeneric);
  prv_display_modal(stack, prv_update_ui_charging, NULL);
#if CHARGE_DETAILS
  if (!custom) {
    return;
  }
  s_charge_dialog = true;
  if (s_charge_timer == TIMER_INVALID_ID) {
    s_charge_timer = new_timer_create();
  }
  if (s_charge_timer != TIMER_INVALID_ID) {
    new_timer_start(s_charge_timer, shell_prefs_get_charging_display().seconds * 1000U,
                  prv_charge_refresh, NULL, 0);
  }
#endif
}

void battery_ui_display_fully_charged(void) {
#if CHARGE_DETAILS
  if (shell_prefs_get_charging_display().flags != ChargingDisplayStock) {
    battery_ui_display_plugged();
    return;
  }
#endif
  // If we're plugged in (charged), we want to alert the user of this,
  // but we don't want to overlay ourselves over anything they may have
  // on the screen at the moment.
  WindowStack *stack = modal_manager_get_window_stack(ModalPriorityGeneric);
  prv_display_modal(stack, prv_update_ui_fully_charged, NULL);
}

void battery_ui_display_warning(uint32_t percent, BatteryUIWarningLevel warning_level) {
#if CHARGE_DETAILS
  if (s_charge_dialog) {
    battery_ui_dismiss_modal();
  }
#endif
  // If we're not plugged in, that means we hit a critical power notification,
  // so we want to alert the user, subverting any non-critical windows they
  // have on the screen.
  WindowStack *stack = modal_manager_get_window_stack(ModalPriorityAlert);

  BatteryWarningDisplayData display_data = {
    .percent = percent,
    .background_color = s_warning_color[warning_level],
    .warning_icon = s_warning_icon[warning_level],
  };
  prv_display_modal(stack, prv_update_ui_warning, &display_data);
  key_sounds_play(KeySoundBatteryLow);
}

void battery_ui_dismiss_modal(void) {
#if CHARGE_DETAILS
  s_charge_dialog = false;
  if (s_charge_timer != TIMER_INVALID_ID) {
    new_timer_stop(s_charge_timer);
  }
#endif
  if (s_dialog) {
    dialog_pop(s_dialog);
    s_dialog = NULL;
  }
}
