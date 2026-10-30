/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */

#include "watchface.h"

#include "kernel/low_power.h"
#include "kernel/ui/modals/modal_manager.h"
#include "kernel/util/factory_reset.h"
#include "popups/timeline/peek.h"
#include "process_management/app_manager.h"

void watchface_return_from_palm(void) {
  const PebbleProcessMd *md = app_manager_get_current_app_md();
  if (low_power_is_active() || factory_reset_ongoing() || !md ||
      process_metadata_get_run_level(md) != ProcessAppRunLevelNormal) {
    return;
  }

  // Keep critical system dialogs and alarms visible.
  modal_manager_pop_all_below_priority(ModalPriorityCritical);
  timeline_peek_dismiss();
  if (!app_manager_is_watchface_running()) {
    watchface_launch_default(NULL);
  }
}
