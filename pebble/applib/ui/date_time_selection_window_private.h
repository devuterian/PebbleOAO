/* SPDX-FileCopyrightText: 2024 Google LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#pragma once

#include <stdint.h>

//! Room for one selection cell: two digits, or a translated AM/PM such as "오전"
#define DATE_TIME_SELECTION_CELL_BUF_SIZE 16

typedef struct {
  uint8_t hour;
  uint8_t minute;
} TimeData;

typedef enum {
  TimeInputIndexHour = 0,
  TimeInputIndexMinute,
  TimeInputIndexAMPM,
} TimeInputIndex;

typedef enum {
  DateInputIndexYear = 0,
  DateInputIndexMonth,
  DateInputIndexDay,
} DateInputIndex;

int date_time_selection_step_hour(int hour, int delta);

int date_time_selection_step_minute(int minute, int delta);

int date_time_selection_step_day(int year, int month, int day, int delta);

int date_time_selection_step_month(int month, int delta);

int date_time_selection_truncate_date(int year, int month, int day);

int date_time_selection_step_year(int year, int delta);

char *date_time_selection_get_text(TimeData *data, TimeInputIndex index, char *buf);

void date_time_handle_time_change(TimeData *data, TimeInputIndex index, int delta);
