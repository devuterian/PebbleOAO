/* SPDX-FileCopyrightText: 2026 Core Devices LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#include "dark_mode_updater.h"

#include <pbl/cron/cron.h>

#include <shell/prefs.h>
#include <shell/system_theme.h>

static bool s_initialized;
static struct pbl_cron_job s_schedule_start_job;
static struct pbl_cron_job s_schedule_end_job;

static void prv_schedule_edge_callback(struct pbl_cron_job *job, void *data) {
  system_theme_request_dark_mode_check();
  pbl_cron_job_schedule(job);
}

static void prv_schedule_daily_job(struct pbl_cron_job *job, uint8_t hour, uint8_t minute) {
  *job = (struct pbl_cron_job){
    .cb = prv_schedule_edge_callback,
    .minute = minute,
    .hour = hour,
    .mday = PBL_CRON_MDAY_ANY,
    .month = PBL_CRON_MONTH_ANY,
  };
  pbl_cron_job_schedule(job);
}

void dark_mode_updater_prefs_changed(void) {
  if (!s_initialized) {
    return;
  }
  pbl_cron_job_unschedule(&s_schedule_start_job);
  pbl_cron_job_unschedule(&s_schedule_end_job);
  if (shell_prefs_get_dark_mode() == DarkModeScheduled) {
    // Cron follows time zone and clock changes, so the two daily edges are the only wakeups
    DarkModeSchedule schedule;
    shell_prefs_get_dark_mode_schedule(&schedule);
    prv_schedule_daily_job(&s_schedule_start_job, schedule.from_hour, schedule.from_minute);
    prv_schedule_daily_job(&s_schedule_end_job, schedule.to_hour, schedule.to_minute);
  }
  // The change itself can flip the mode, including switching it off
  system_theme_request_dark_mode_check();
}

void dark_mode_updater_init(void) {
  s_initialized = true;
  dark_mode_updater_prefs_changed();
}
