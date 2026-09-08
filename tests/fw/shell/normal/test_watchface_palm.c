/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */

#include "clar.h"
#include "shell/normal/watchface.h"
#include "kernel/ui/modals/modal_manager.h"
#include "process_management/app_manager.h"
#include "stubs_logging.h"
#include "stubs_passert.h"

static PebbleProcessMd s_md;
static bool s_have_app, s_low_power, s_resetting, s_watchface;
static ProcessAppRunLevel s_run_level;
static int s_launch_count, s_pop_count, s_peek_count;
static ModalPriority s_pop_priority;
static const CompositorTransition *s_transition;

const PebbleProcessMd *app_manager_get_current_app_md(void) {
  return s_have_app ? &s_md : NULL;
}

bool low_power_is_active(void) { return s_low_power; }
bool factory_reset_ongoing(void) { return s_resetting; }
bool app_manager_is_watchface_running(void) { return s_watchface; }
ProcessAppRunLevel process_metadata_get_run_level(const PebbleProcessMd *md) {
  return s_run_level;
}
void watchface_launch_default(const CompositorTransition *transition) {
  s_launch_count++;
  s_transition = transition;
}
void modal_manager_pop_all_below_priority(ModalPriority priority) {
  s_pop_count++;
  s_pop_priority = priority;
}
void timeline_peek_dismiss(void) { s_peek_count++; }

void test_watchface_palm__initialize(void) {
  s_have_app = true;
  s_low_power = s_resetting = s_watchface = false;
  s_run_level = ProcessAppRunLevelNormal;
  s_launch_count = s_pop_count = s_peek_count = 0;
  s_pop_priority = ModalPriorityInvalid;
}

void test_watchface_palm__app_returns_to_selected_watchface(void) {
  watchface_return_from_palm();
  cl_assert_equal_i(s_launch_count, 1);
  cl_assert(s_transition == NULL);
  cl_assert_equal_i(s_pop_count, 1);
  cl_assert_equal_i(s_pop_priority, ModalPriorityCritical);
  cl_assert_equal_i(s_peek_count, 1);
}

void test_watchface_palm__notification_dismissed_without_restarting_watchface(void) {
  s_watchface = true;
  watchface_return_from_palm();
  cl_assert_equal_i(s_launch_count, 0);
  cl_assert_equal_i(s_pop_count, 1);
  cl_assert_equal_i(s_pop_priority, ModalPriorityCritical);
  cl_assert_equal_i(s_peek_count, 1);
}

static void prv_assert_ignored(void) {
  watchface_return_from_palm();
  cl_assert_equal_i(s_launch_count, 0);
  cl_assert_equal_i(s_pop_count, 0);
  cl_assert_equal_i(s_peek_count, 0);
}

void test_watchface_palm__system_apps_are_not_interrupted(void) {
  s_run_level = ProcessAppRunLevelSystem;
  prv_assert_ignored();
  s_run_level = ProcessAppRunLevelCritical;
  prv_assert_ignored();
}

void test_watchface_palm__low_power_is_not_interrupted(void) {
  s_low_power = true;
  prv_assert_ignored();
}

void test_watchface_palm__factory_reset_is_not_interrupted(void) {
  s_resetting = true;
  prv_assert_ignored();
}

void test_watchface_palm__no_app_is_ignored(void) {
  s_have_app = false;
  prv_assert_ignored();
}
