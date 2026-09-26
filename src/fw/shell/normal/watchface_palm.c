/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */

#include "watchface.h"

#include "kernel/low_power.h"
#include "applib/ui/window_stack.h"
#include "kernel/ui/modals/modal_manager.h"
#include "kernel/util/factory_reset.h"
#include "popups/timeline/peek.h"
#include "process_management/app_manager.h"

static bool prv_modal_priority_in_use(ModalPriority priority) {
  WindowStack *stack = modal_manager_get_window_stack(priority);
  return stack && window_stack_count(stack) > 0;
}

void watchface_return_from_palm(void) {
  const PebbleProcessMd *md = app_manager_get_current_app_md();
  if (low_power_is_active() || factory_reset_ongoing() || !md ||
      process_metadata_get_run_level(md) != ProcessAppRunLevelNormal) {
    return;
  }
  // Popping these would hang up an incoming call's screen or abort a dictation.
  if (prv_modal_priority_in_use(ModalPriorityPhone) ||
      prv_modal_priority_in_use(ModalPriorityVoice)) {
    return;
  }

  // Keep critical system dialogs and alarms visible.
  modal_manager_pop_all_below_priority(ModalPriorityCritical);
  timeline_peek_dismiss();
  if (!app_manager_is_watchface_running()) {
    watchface_launch_default(NULL);
  }
}
