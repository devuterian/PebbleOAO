/* SPDX-FileCopyrightText: 2026 Core Devices LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#include "dark_mode_updater.h"

#include <pbl/cron/cron.h>

#include <shell/prefs.h>
#include <shell/system_theme.h>

static bool s_initialized;
static struct pbl_cron_job s_schedule_start_job;
static struct pbl_cron_job s_schedule_end_job;

static bool prv_follows_clock(DarkMode mode) {
  return mode == DarkModeScheduled || mode == DarkModeSunset;
}

static void prv_schedule_edge_callback(struct pbl_cron_job *job, void *data) {
  system_theme_request_dark_mode_check();
  // Scheduled mode may have been switched off while this job was running
  if (prv_follows_clock(shell_prefs_get_dark_mode())) {
    pbl_cron_job_schedule(job);
  }
}

static void prv_init_daily_job(struct pbl_cron_job *job) {
  *job = (struct pbl_cron_job){
    .cb = prv_schedule_edge_callback,
    .mday = PBL_CRON_MDAY_ANY,
    .month = PBL_CRON_MONTH_ANY,
  };
}

static void prv_schedule_daily_job(struct pbl_cron_job *job, uint8_t hour, uint8_t minute) {
  // Only touch the time fields: the edge callback may reschedule the job concurrently, so the
  // list node must never be overwritten
  job->hour = hour;
  job->minute = minute;
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
#ifdef CONFIG_BACKLIGHT_HAS_COLOR
  if (shell_prefs_get_dark_mode() == DarkModeSunset) {
    // Same sunrise/sunset the night backlight color uses, kept current by the phone
    const uint16_t sunset = backlight_get_sunset_minute();
    const uint16_t sunrise = backlight_get_sunrise_minute();
    prv_schedule_daily_job(&s_schedule_start_job, sunset / 60, sunset % 60);
    prv_schedule_daily_job(&s_schedule_end_job, sunrise / 60, sunrise % 60);
  }
#endif
  // The change itself can flip the mode, including switching it off
  system_theme_request_dark_mode_check();
}

void dark_mode_updater_handle_clock_change(void) {
  // A clock jump can cross a schedule edge that cron then skips
  if (s_initialized && prv_follows_clock(shell_prefs_get_dark_mode())) {
    system_theme_request_dark_mode_check();
  }
}

void dark_mode_updater_handle_backlight_on(void) {
  // The light service just sampled the sensor to decide on the backlight, so this is a cached
  // read. It gets the mode right before the app the user is opening draws its first frame.
  if (s_initialized && shell_prefs_get_dark_mode() == DarkModeAmbient) {
    system_theme_request_dark_mode_check();
  }
}

void dark_mode_updater_init(void) {
  prv_init_daily_job(&s_schedule_start_job);
  prv_init_daily_job(&s_schedule_end_job);
  s_initialized = true;
  dark_mode_updater_prefs_changed();
}
