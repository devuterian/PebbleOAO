/* SPDX-FileCopyrightText: 2024 Google LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#include "system_theme.h"

#include "system_theme_style.h"

#include <pbl/drivers/rtc.h>
#include <pbl/kernel/assert.h>
#include <pbl/kernel/fatal.h>
#include <pbl/kernel/syscall.h>
#include <pbl/logging/logging.h>
#include <pbl/services/light.h>
#ifdef CONFIG_SPEAKER
#include <pbl/services/speaker/speaker_service.h>
#endif
#include <pbl/services/system_task.h>
#include <pbl/util/size.h>
#include <pbl/util/testing.h>

#include <applib/fonts/fonts.h>
#include <kernel/events.h>
#include <process_management/pebble_process_md.h>
#include <process_management/process_manager.h>
#include <shell/prefs.h>
#include <syscall/syscall.h>

////////////////////
// Helpers

static const char *prv_get_font_for_size(bool from_user, PreferredContentSize content_size,
                                         TextStyleFont font) {
  if (content_size >= NumPreferredContentSizes) {
    PBL_LOG_ERR("Requested a content size that is out of bounds (%d)", content_size);
    goto fail;
  } else if (font >= TextStyleFontCount) {
    PBL_LOG_ERR("Requested a style font that is out of bounds (%d)", font);
    goto fail;
  }
  return system_theme_get_style_for_size(content_size)->fonts[font];
fail:
  from_user ? pbl_syscall_fail() : pbl_panic();
}

////////////////////
// Public API

// *** WARNING WARNING WARNING ***
// Be very careful when modifying this syscall. It currently returns a pointer
// to constant data in flash, which unprivileged apps are allowed to read. But
// if the data pointed to is ever moved to RAM, the syscall will need to be
// changed to copy the data into a caller-provided buffer. Unprivileged apps
// are not allowed to read kernel RAM, so they will fault if they attempt to
// dereference a pointer into kernel RAM.
PBL_SYSCALL(const char *, system_theme_get_font_key, (VAL, TextStyleFont, font)) {
  return prv_get_font_for_size(from_user, system_theme_get_content_size(), font);
}

// *** WARNING WARNING WARNING ***
// Be very careful when modifying this syscall. It currently returns a pointer
// to constant data in flash, which unprivileged apps are allowed to read.
PBL_SYSCALL(const char *, system_theme_get_font_key_for_size,
            (VAL, PreferredContentSize, content_size), (VAL, TextStyleFont, font)) {
  const PreferredContentSize size_on_runtime_platform =
      system_theme_convert_host_content_size_to_runtime_platform(content_size);
  return prv_get_font_for_size(from_user, size_on_runtime_platform, font);
}

GFont system_theme_get_font(TextStyleFont font) {
  return fonts_get_system_font(system_theme_get_font_key(font));
}

GFont system_theme_get_font_for_size(PreferredContentSize size, TextStyleFont font) {
  return fonts_get_system_font(system_theme_get_font_key_for_size(size, font));
}

GFont system_theme_get_font_for_default_size(TextStyleFont font) {
  return fonts_get_system_font(
      system_theme_get_font_key_for_size(PreferredContentSizeDefault, font));
}

//! Returns true if the current (system) app context should render in dark mode.
static bool prv_is_system_app(void) {
  const PebbleTask task = pebble_task_get_current();
  if (task != PebbleTask_App && task != PebbleTask_Worker) {
    // Kernel / other tasks are always treated as system
    return true;
  }
  const ProcessAppSDKType sdk_type =
      process_metadata_get_app_sdk_type(sys_process_manager_get_current_process_md());
  return sdk_type == ProcessAppSDKType_System;
}

PBL_SYSCALL(bool, system_theme_is_system_ui) {
  return prv_is_system_app();
}

// Colors are looked up on draw paths, often several times per frame, so they never sample the
// ambient light: an unprimed read polls the sensor for up to 200 ms. They use the last sample and
// ask the system task for a new one once it is this old.
#define AMBIENT_DARK_MODE_MAX_AGE_TICKS (30 * RTC_TICKS_HZ)

static volatile bool s_ambient_is_dark;
static volatile bool s_ambient_sampled;
static volatile RtcTicks s_ambient_sampled_ticks;
static volatile bool s_dark_mode_check_pending;
//! Last state announced with PEBBLE_DARK_MODE_CHANGE_EVENT. Only used on the system task.
static bool s_announced_is_dark;

static void prv_sample_ambient(void) {
  // While the backlight is on, the light service keeps returning the reading from before it
  // turned on, so the backlight itself can't make the room look bright.
  s_ambient_is_dark = light_get_ambient_gate_lux() <= light_get_dark_threshold();
  s_ambient_sampled_ticks = rtc_get_ticks();
  s_ambient_sampled = true;
}

static bool prv_ambient_sample_is_stale(void) {
  return !s_ambient_sampled ||
         (rtc_get_ticks() - s_ambient_sampled_ticks) >= AMBIENT_DARK_MODE_MAX_AGE_TICKS;
}

// The speaker refills its buffer on the system task too, so a slow sensor read would make
// audio stutter. Keep the old sample while sound plays; the next request retries.
static bool prv_audio_is_active(void) {
#ifdef CONFIG_SPEAKER
  return speaker_service_get_state() != SpeakerStateIdle;
#else
  return false;
#endif
}

static void prv_dark_mode_check_callback(void *data) {
  s_dark_mode_check_pending = false;
  if (shell_prefs_get_dark_mode() == DarkModeAmbient && prv_ambient_sample_is_stale() &&
      !prv_audio_is_active()) {
    prv_sample_ambient();
  }
  // KernelBG counts as system UI, so this is the state system apps draw with
  const bool is_dark = system_theme_is_dark_mode();
  if (is_dark == s_announced_is_dark) {
    return;
  }
  s_announced_is_dark = is_dark;
  PebbleEvent event = {
    .type = PEBBLE_DARK_MODE_CHANGE_EVENT,
  };
  event_put(&event);
}

void system_theme_request_dark_mode_check(void) {
  if (s_dark_mode_check_pending) {
    return;
  }
  s_dark_mode_check_pending = true;
  // Droppable: this can be called while drawing, which must not wait for the queue. A dropped
  // request is retried by the next caller.
  if (!system_task_add_callback_droppable(prv_dark_mode_check_callback, nullptr)) {
    s_dark_mode_check_pending = false;
  }
}

static bool prv_is_ambient_dark(void) {
  if (prv_ambient_sample_is_stale()) {
    system_theme_request_dark_mode_check();
  }
  return s_ambient_is_dark;
}

// App metadata is privileged memory, including when dark mode is disabled.
PBL_SYSCALL(bool, system_theme_is_dark_mode) {
  // Dark mode is only supported on color platforms, so treat all non-color platforms as light mode
  if (PBL_IF_COLOR_ELSE(false, true)) {
    return false;
  }
  if (!prv_is_system_app()) {
    return false;
  }
  switch (shell_prefs_get_dark_mode()) {
    case DarkModeOff:
      return false;
    case DarkModeOn:
      return true;
    case DarkModeAmbient:
      return prv_is_ambient_dark();
    case DarkModeScheduled: {
      DarkModeSchedule schedule;
      shell_prefs_get_dark_mode_schedule(&schedule);
      struct pbl_tm time_now;
      rtc_get_time_tm(&time_now);
      const int now_min = time_now.tm_hour * 60 + time_now.tm_min;
      const int start_min = schedule.from_hour * 60 + schedule.from_minute;
      const int end_min = schedule.to_hour * 60 + schedule.to_minute;
      if (start_min == end_min) {
        return false;
      }
      if (start_min < end_min) {
        return (now_min >= start_min && now_min < end_min);
      } else {
        return (now_min >= start_min || now_min < end_min);
      }
    }
    default:
      return false;
  }
}

GColor system_theme_get_bg_color(void) {
  return system_theme_is_dark_mode() ? GColorBlack : GColorWhite;
}

GColor system_theme_get_fg_color(void) {
  return system_theme_is_dark_mode() ? GColorWhite : GColorBlack;
}

static const PreferredContentSize s_platform_default_content_sizes[] = {
  [PlatformTypeAplite] = PreferredContentSizeMedium,
  [PlatformTypeBasalt] = PreferredContentSizeMedium,
  [PlatformTypeChalk] = PreferredContentSizeMedium,
  [PlatformTypeDiorite] = PreferredContentSizeMedium,
  [PlatformTypeEmery] = PreferredContentSizeLarge,
  [PlatformTypeFlint] = PreferredContentSizeMedium,
  [PlatformTypeGabbro] = PreferredContentSizeLarge,
};

PBL_T_STATIC PreferredContentSize prv_convert_content_size_between_platforms(
    PreferredContentSize size, PlatformType from_platform, PlatformType to_platform) {
  const size_t num_platform_default_content_sizes = ARRAY_LENGTH(s_platform_default_content_sizes);
  PBL_ASSERTN(from_platform < num_platform_default_content_sizes);
  PBL_ASSERTN(to_platform < num_platform_default_content_sizes);

  const PreferredContentSize from_platform_default_size =
      s_platform_default_content_sizes[from_platform];
  const PreferredContentSize to_platform_default_size =
      s_platform_default_content_sizes[to_platform];
  const int resulting_size = size + (to_platform_default_size - from_platform_default_size);
  return (PreferredContentSize)CLIP(resulting_size, 0, (NumPreferredContentSizes - 1));
}

PreferredContentSize system_theme_get_default_content_size_for_runtime_platform(void) {
  const PlatformType runtime_platform = process_manager_current_platform();
  return prv_convert_content_size_between_platforms(PreferredContentSizeDefault,
                                                    PBL_PLATFORM_TYPE_CURRENT, runtime_platform);
}

PreferredContentSize system_theme_convert_host_content_size_to_runtime_platform(
    PreferredContentSize size) {
  const PlatformType runtime_platform = process_manager_current_platform();
  return prv_convert_content_size_between_platforms(size, PBL_PLATFORM_TYPE_CURRENT,
                                                    runtime_platform);
}
