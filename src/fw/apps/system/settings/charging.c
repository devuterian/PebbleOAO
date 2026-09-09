/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */
#include "charging.h"
#include "window.h"
#include "kernel/pbl_malloc.h"
#include "applib/ui/menu_layer.h"
#include "applib/ui/ui.h"
#include "pbl/services/i18n/i18n.h"
#include "shell/charging_preferences.h"

#if defined(CONFIG_BOARD_OBELIX) || defined(CONFIG_BOARD_QEMU_EMERY)
enum {
  RowMode, RowDecimals, RowInterval, RowLimit, RowReset, RowCount,
};
static const char *s_titles[RowCount] = {
  i18n_noop("Charging screen"), i18n_noop("Decimal places"),
  i18n_noop("Refresh interval"), i18n_noop("Charge Limit (80%)"),
  i18n_noop("Reset charging display"),
};
static const uint8_t s_intervals[] = {3, 5, 10, 30, 60};

static void prv_select(SettingsCallbacks *context, uint16_t row) {
  ChargingDisplayPrefs prefs = shell_prefs_get_charging_display();
  switch (row) {
    case RowMode:
      prefs.flags = prefs.flags == 31 ? ChargingDisplayStock :
                    prefs.flags == ChargingDisplayStock ?
                      (ChargingDisplayIcon | ChargingDisplayPercent) : 31;
      break;
    case RowDecimals: prefs.decimals = (prefs.decimals + 1) % 4; break;
    case RowInterval:
      for (unsigned i = 0; i < sizeof(s_intervals); i++) {
        if (prefs.seconds == s_intervals[i]) {
          prefs.seconds = s_intervals[(i + 1) % sizeof(s_intervals)];
          break;
        }
      }
      break;
    case RowLimit:
      shell_prefs_set_charge_limit_enabled(!shell_prefs_get_charge_limit_enabled());
      settings_menu_mark_dirty(SettingsMenuItemCharging);
      return;
    case RowReset: prefs = (ChargingDisplayPrefs)CHARGING_DISPLAY_DEFAULTS; break;
  }
  shell_prefs_set_charging_display(prefs);
  settings_menu_mark_dirty(SettingsMenuItemCharging);
}

static void prv_draw(SettingsCallbacks *context, GContext *ctx, const Layer *layer,
                     uint16_t row, bool selected) {
  ChargingDisplayPrefs prefs = shell_prefs_get_charging_display();
  const char *subtitle = NULL;
  char buffer[32];
  if (row == RowMode) {
    subtitle = i18n_get(prefs.flags == ChargingDisplayStock ? "Original charging screen" :
                        prefs.flags == 31 ? "All charging details" : "Icon and percentage", context);
  } else if (row == RowDecimals) {
    snprintf(buffer, sizeof(buffer), i18n_get("%u digits", context), prefs.decimals);
    subtitle = buffer;

  } else if (row == RowInterval) {
    snprintf(buffer, sizeof(buffer), i18n_get("%u seconds", context), prefs.seconds);
    subtitle = buffer;
  } else if (row == RowLimit) {
    subtitle = i18n_get(shell_prefs_get_charge_limit_enabled() ? "On" : "Off", context);
  }
  menu_cell_basic_draw(ctx, layer, i18n_get(s_titles[row], context), subtitle, NULL);
}

static uint16_t prv_count(SettingsCallbacks *context) { return RowCount; }
static void prv_deinit(SettingsCallbacks *context) {
  i18n_free_all(context);
  app_free(context);
}
static Window *prv_init(void) {
  SettingsCallbacks *callbacks = app_malloc_check(sizeof(*callbacks));
  *callbacks = (SettingsCallbacks) {
    .draw_row = prv_draw, .select_click = prv_select,
    .num_rows = prv_count, .deinit = prv_deinit,
  };
  return settings_window_create(SettingsMenuItemCharging, callbacks);
}
const SettingsModuleMetadata *settings_charging_get_info(void) {
  static const SettingsModuleMetadata info = {
    .name = i18n_noop("Charging settings"), .init = prv_init,
  };
  return &info;
}
#endif
