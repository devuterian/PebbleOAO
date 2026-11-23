/* SPDX-FileCopyrightText: 2024 Google LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#include "clar.h"

#include "pbl/services/i18n/i18n.h"
#include "stubs_fonts.h"
#include "stubs_graphics.h"
#include "stubs_text_node.h"

#include "shell/prefs.h"
#include "pbl/services/activity/health_util.h"

#include <string.h>

static bool s_korean;

const char *i18n_get(const char *msgid, const void *owner) {
  if (s_korean) {
    if (strcmp(msgid, "%dH") == 0) {
      return "%d시간";
    }
    if (strcmp(msgid, "%dM") == 0) {
      return "%d분";
    }
  }
  return msgid;
}

void i18n_free(const char *msgid, const void *owner) { }

void test_health_util__initialize(void) {
  s_korean = false;
}

void test_health_util__duration_buffer_bounds(void) {
  for (int language = 0; language < 2; ++language) {
    s_korean = language;
    const char *expected = s_korean ? "7시간 32분" : "7H 32M";
    for (size_t size = 0; size <= strlen(expected) + 1; ++size) {
      char buffer[32];
      memset(buffer, '!', sizeof(buffer));
      const int length = health_util_format_hours_and_minutes(buffer, size,
          7 * 3600 + 32 * 60, NULL);
      cl_assert_equal_i(length, strlen(expected));
      if (size) {
        cl_assert_equal_i(buffer[size - 1], '\0');
        cl_assert_equal_i(memcmp(buffer, expected, size - 1), 0);
      }
      for (size_t i = size; i < sizeof(buffer); ++i) {
        cl_assert_equal_i(buffer[i], '!');
      }
    }
    cl_assert_equal_i(health_util_format_hours_and_minutes(NULL, 0,
        7 * 3600 + 32 * 60, NULL), strlen(expected));
  }
}

void test_health_util__duration_boundaries(void) {
  const struct {
    int duration;
    const char *english;
    const char *korean;
  } cases[] = {
    {0, "0H", "0시간"},
    {32 * 60, "32M", "32분"},
    {3600, "1H", "1시간"},
    {10 * 3600 + 32 * 60, "10H 32M", "10시간 32분"},
    {11 * 3600 + 30 * 60, "11H 30M", "11시간 30분"},
    {12 * 3600 + 59 * 60, "12H 59M", "12시간 59분"},
  };
  for (int language = 0; language < 2; ++language) {
    s_korean = language;
    for (size_t i = 0; i < sizeof(cases) / sizeof(cases[0]); ++i) {
      char buffer[32];
      const char *expected = s_korean ? cases[i].korean : cases[i].english;
      cl_assert_equal_i(health_util_format_hours_and_minutes(buffer, sizeof(buffer),
          cases[i].duration, NULL), strlen(expected));
      cl_assert_equal_s(buffer, expected);
    }
  }
}

UnitsDistance shell_prefs_get_units_distance(void) {
  return UnitsDistance_Miles;
}

void test_health_util__pace(void) {
  cl_assert_equal_i(health_util_get_pace(29, 4800), 10); // PBL-36661
  cl_assert_equal_i(health_util_get_pace(10, 800), 20); // less than a mile
  cl_assert_equal_i(health_util_get_pace(820, 262400), 5); // many miles / long distance
}
