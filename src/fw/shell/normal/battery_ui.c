/* SPDX-FileCopyrightText: 2024 Google LLC */
/* SPDX-License-Identifier: Apache-2.0 */

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
#include "applib/fonts/fonts.h"

#if defined(CONFIG_BOARD_OBELIX) || defined(CONFIG_BOARD_QEMU_EMERY)
#define CHARGE_DETAILS 1
static TimerID s_charge_timer = TIMER_INVALID_ID;
static bool s_charge_dialog;
static char s_charge_percent[16];
static char s_charge_detail[140];
static void prv_update_ui_charging(Dialog *dialog, void *ignored);

static void prv_charge_draw(Layer *layer, GContext *ctx) {
  GRect bounds = layer->bounds;
  graphics_context_set_fill_color(ctx, layer_get_window(layer)->background_color);
  graphics_fill_rect(ctx, &bounds);
  graphics_context_set_text_color(ctx, ((TextLayer *)layer)->text_color);
  graphics_draw_text(ctx, s_charge_percent, fonts_get_system_font(FONT_KEY_LECO_36_BOLD_NUMBERS),
                     GRect(4, bounds.size.h / 2 - 45, bounds.size.w - 8, 55),
                     GTextOverflowModeTrailingEllipsis, GTextAlignmentCenter, NULL);
  graphics_draw_text(ctx, s_charge_detail, fonts_get_system_font(FONT_KEY_GOTHIC_18),
                     GRect(4, bounds.size.h / 2 + 12, bounds.size.w - 8, 28),
                     GTextOverflowModeTrailingEllipsis, GTextAlignmentCenter, NULL);
}

static void prv_charge_load(void *context) {
  Dialog *dialog = context;
  if (!s_charge_dialog) {
    return;
  }
  layer_set_frame(&dialog->text_layer.layer, &dialog->window.layer.bounds);
  layer_set_update_proc(&dialog->text_layer.layer, prv_charge_draw);
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
  prv_update_ui_charging(dialog, NULL);
  return;
#else
  dialog_set_text(dialog, i18n_get("Fully Charged", dialog));
#endif
  dialog_set_background_color(dialog, GColorKellyGreen);
  dialog_set_icon(dialog, RESOURCE_ID_BATTERY_ICON_FULL_LARGE);
}

static void prv_update_ui_charging(Dialog *dialog, void *ignored) {
#if CHARGE_DETAILS
  BatteryChargeState state = battery_get_charge_state();
  bool limited = shell_prefs_get_charge_limit_enabled();
  uint8_t target = limited ? 80 : 100;
  uint32_t mpct = battery_state_get_millipercent();
  snprintf(s_charge_percent, sizeof(s_charge_percent), "%lu.%03lu%%",
           (unsigned long)(mpct / 1000), (unsigned long)(mpct % 1000));
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
    snprintf(s_charge_detail, sizeof(s_charge_detail), "%s / %s", power, duration);
  }
  dialog_set_background_color(dialog, status ? GColorKellyGreen : system_theme_get_bg_color());
  dialog_set_text_color(dialog, status ? GColorBlack : system_theme_get_fg_color());
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
    battery_state_request_sample();
    prv_update_ui_charging(s_dialog, NULL);
  }
  new_timer_start(s_charge_timer, 3000, prv_charge_refresh, NULL, 0);
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
  if (s_dialog && !s_charge_dialog) {
    battery_ui_dismiss_modal();
  }
  s_charge_dialog = true;
#endif
  // If we're plugged in for charging, we want to alert the user of this,
  // but we don't want to overlay ourselves over anything they may have
  // on the screen at the moment.
  WindowStack *stack = modal_manager_get_window_stack(ModalPriorityGeneric);
  prv_display_modal(stack, prv_update_ui_charging, NULL);
#if CHARGE_DETAILS
  s_charge_dialog = true;
  if (s_charge_timer == TIMER_INVALID_ID) {
    s_charge_timer = new_timer_create();
  }
  if (s_charge_timer != TIMER_INVALID_ID) {
    new_timer_start(s_charge_timer, 3000, prv_charge_refresh, NULL, 0);
  }
#endif
}

void battery_ui_display_fully_charged(void) {
#if CHARGE_DETAILS
  battery_ui_display_plugged();
  return;
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
