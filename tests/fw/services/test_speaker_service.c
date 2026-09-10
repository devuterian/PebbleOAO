/* SPDX-FileCopyrightText: 2026 Core Devices LLC */
/* SPDX-License-Identifier: Apache-2.0 */

#include "clar.h"

#include "pbl/services/speaker/speaker_service.h"

#include <pbl/drivers/audio.h>
#include <pbl/drivers/rtc.h>

#include <string.h>

#include "stubs_logging.h"
#include "stubs_passert.h"
#include "stubs_analytics.h"
#include "stubs_rtc.h"
#include "resource/resource.h"
#include "fake_mutex.h"
#include "fake_pbl_malloc.h"
#include "fake_system_task.h"
#include "fake_events.h"
#include "fake_pebble_tasks.h"

static bool s_dnd;
bool do_not_disturb_is_active(void) {
  return s_dnd;
}
static size_t s_resource_size;
static uint32_t s_resource_read;
static bool s_resource_read_fails;
size_t resource_size(ResAppNum app, uint32_t id) {
  return s_resource_size;
}
size_t resource_load_byte_range_system(ResAppNum app, uint32_t id, uint32_t offset, uint8_t *data,
                                       size_t size) {
  if (s_resource_read_fails) {
    return 0;
  }
  cl_assert_equal_i(offset, s_resource_read);
  cl_assert(offset + size <= s_resource_size);
  // Nonzero final sample makes truncating the tail observable.
  memset(data, 1, size);
  s_resource_read += size;
  return size;
}

// Alerts preferences: speaker unmuted, no volume cap
static bool s_muted;
static uint8_t s_cap;
bool alerts_preferences_get_speaker_muted(void) {
  return s_muted;
}
uint8_t alerts_preferences_get_speaker_volume(void) {
  return s_cap;
}
bool alerts_preferences_dnd_get_mute_speaker(void) { return false; }

// ---------------------------------------------------------------------------
// Fake audio driver. Counts what the service hands to the hardware so the
// tests can tell how much audio would actually have been played before the
// service powered the speaker down.

static AudioTransCB s_trans_cb;
static int s_start_count;
static int s_stop_count;
static uint32_t s_samples_written;
static uint32_t s_nonzero_samples;

void audio_init(AudioDevice *device) {}

void audio_start(AudioDevice *device, AudioTransCB cb) {
  s_trans_cb = cb;
  s_start_count++;
}

uint32_t audio_write(AudioDevice *device, void *buf, uint32_t size) {
  const int16_t *samples = buf;
  const uint32_t num_samples = size / sizeof(int16_t);
  for (uint32_t i = 0; i < num_samples; i++) {
    if (samples[i] != 0) {
      s_nonzero_samples++;
    }
  }
  s_samples_written += num_samples;
  return 0;
}

static int s_volume;
void audio_set_volume(AudioDevice *device, int volume) {
  s_volume = volume;
}

void audio_stop(AudioDevice *device) {
  s_stop_count++;
  s_trans_cb = NULL;
}

// ---------------------------------------------------------------------------

#define SAMPLE_RATE 16000
// Must match SPEAKER_PIPELINE_DRAIN_SAMPLES in speaker_service.c
#define DRAIN_SAMPLES ((SAMPLE_RATE * 80) / 1000)

// Simulate the driver requesting more data until playback stops on its own.
static void prv_pump_until_idle(void) {
  for (int i = 0; i < 1000 && s_trans_cb; i++) {
    uint32_t free_size = 4096;
    s_trans_cb(&free_size);
    fake_system_task_callbacks_invoke_pending();
  }
}

void test_speaker_service__initialize(void) {
  fake_system_task_callbacks_cleanup();
  s_dnd = false;
  s_muted = false;
  s_cap = 100;
  s_resource_size = 135598;
  s_resource_read = 0;
  s_resource_read_fails = false;
  s_trans_cb = NULL;
  s_start_count = 0;
  s_stop_count = 0;
  s_samples_written = 0;
  s_nonzero_samples = 0;
  speaker_service_init();
}

void test_speaker_service__cleanup(void) {
  speaker_service_stop();
  fake_system_task_callbacks_cleanup();
}

// A tone shorter than the driver's DMA pipeline (~64 ms) must still be
// generated in full and followed by enough padding silence that the queued
// samples play out before the service stops the hardware.
void test_speaker_service__short_tone_drains_pipeline_before_stop(void) {
  const uint16_t duration_ms = 25;
  const uint32_t tone_samples = (SAMPLE_RATE * duration_ms) / 1000;

  cl_assert(speaker_service_play_tone(1000, duration_ms, 0 /* sine */,
                                      0 /* full velocity */,
                                      SpeakerPriorityApp, 80));
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStatePlaying);

  prv_pump_until_idle();

  cl_assert_equal_i(speaker_service_get_state(), SpeakerStateIdle);
  cl_assert_equal_i(s_start_count, 1);
  cl_assert_equal_i(s_stop_count, 1);
  // The full tone reached the driver (1 kHz sine: allow for zero crossings)
  cl_assert(s_nonzero_samples > tone_samples / 2);
  // ...followed by at least a pipeline depth of padding silence
  cl_assert(s_samples_written >= tone_samples + DRAIN_SAMPLES);
}

// While only padding silence remains, a new same-priority sound must be able
// to start instead of being rejected (rapid re-triggers, e.g. a metronome).
void test_speaker_service__same_priority_preempts_during_drain(void) {
  cl_assert(speaker_service_play_tone(1000, 25, 0, 0, SpeakerPriorityApp, 80));

  uint32_t free_size = 4096;
  s_trans_cb(&free_size);
  fake_system_task_callbacks_invoke_pending();
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStateDraining);

  cl_assert(speaker_service_play_tone(2000, 25, 0, 0, SpeakerPriorityApp, 80));
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStatePlaying);

  prv_pump_until_idle();
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStateIdle);
}

// A sound still generating real samples must NOT be preemptable by the same
// priority (unchanged behavior).
void test_speaker_service__same_priority_cannot_preempt_while_playing(void) {
  cl_assert(speaker_service_play_tone(1000, 500, 0, 0, SpeakerPriorityApp, 80));
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStatePlaying);

  cl_assert(!speaker_service_play_tone(2000, 25, 0, 0, SpeakerPriorityApp, 80));
}

void test_speaker_service__chime_preserves_entire_tail_and_drains(void) {
  cl_assert(speaker_service_play_chime_resource(123));
  prv_pump_until_idle();
  cl_assert_equal_i(s_resource_read, s_resource_size);
  cl_assert_equal_i(s_nonzero_samples, s_resource_size / 2);
  cl_assert_equal_i(s_samples_written, s_resource_size / 2 + DRAIN_SAMPLES);
  cl_assert_equal_i(s_stop_count, 1);
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStateIdle);
}
void test_speaker_service__chime_dnd_stops_without_reading_tail(void) {
  s_dnd = true;
  cl_assert(!speaker_service_play_chime_resource(123));
  cl_assert_equal_i(s_start_count, 0);
  s_dnd = false;
  cl_assert(speaker_service_play_chime_resource(123));
  s_dnd = true;
  prv_pump_until_idle();
  cl_assert(s_resource_read < s_resource_size);
  cl_assert_equal_i(s_stop_count, 1);
}
void test_speaker_service__chime_does_not_interrupt_and_yields_to_alerts(void) {
  cl_assert(speaker_service_play_tone(440, 1000, 0, 0, SpeakerPriorityApp, 100));
  cl_assert(!speaker_service_play_chime_resource(123));
  speaker_service_stop();
  cl_assert(speaker_service_play_chime_resource(123));
  cl_assert(speaker_service_play_tone(440, 1000, 0, 0, SpeakerPriorityNotification, 100));
  prv_pump_until_idle();
  cl_assert(s_resource_read < s_resource_size);
}
void test_speaker_service__chime_invalid_resource_and_read_failure(void) {
  s_resource_size = 0;
  cl_assert(!speaker_service_play_chime_resource(123));
  s_resource_size = 3;
  cl_assert(!speaker_service_play_chime_resource(123));
  s_resource_size = 100;
  s_resource_read_fails = true;
  speaker_service_play_chime_resource(123);
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStateIdle);
}

void test_speaker_service__chime_preserves_app_finish_subscription(void) {
  speaker_service_register_finish(PebbleTask_App);
  fake_event_reset_count();
  cl_assert(speaker_service_play_chime_resource(123));
  prv_pump_until_idle();
  cl_assert_equal_i(fake_event_get_count(), 0);
  cl_assert(speaker_service_play_tone(440, 100, 0, 0, SpeakerPriorityApp, 100));
  prv_pump_until_idle();
  cl_assert_equal_i(fake_event_get_count(), 1);
  cl_assert_equal_i(fake_event_get_last().type, PEBBLE_SPEAKER_EVENT);
}

void test_speaker_service__ui_preserves_samples_and_tail(void) {
  static const int16_t pcm[] = {100, 200, 300, 400, 500};
  cl_assert(speaker_service_play_ui_pcm(pcm, 5, 35, false));
  prv_pump_until_idle();
  cl_assert_equal_i(s_nonzero_samples, 5);
  cl_assert_equal_i(s_samples_written, 5 + DRAIN_SAMPLES);
  cl_assert_equal_i(s_stop_count, 1);
}

void test_speaker_service__ui_replaces_without_restarting_audio(void) {
  static int16_t pcm[2048];
  for (unsigned i = 0; i < 2048; i++) {
    pcm[i] = 1000;
  }
  for (unsigned i = 0; i < 30; i++) {
    cl_assert(speaker_service_play_ui_pcm(pcm, 2048, 35, false));
  }
  cl_assert_equal_i(s_start_count, 1);
  cl_assert_equal_i(s_stop_count, 0);
  prv_pump_until_idle();
  cl_assert_equal_i(s_stop_count, 1);
  cl_assert(s_samples_written < 3 * 2048 + DRAIN_SAMPLES);
}

void test_speaker_service__ui_yields_to_apps_and_never_interrupts_chime(void) {
  static int16_t pcm[2048];
  cl_assert(speaker_service_play_ui_pcm(pcm, 2048, 35, false));
  cl_assert(speaker_service_play_tone(440, 1000, 0, 0, SpeakerPriorityApp, 100));
  cl_assert(!speaker_service_play_ui_pcm(pcm, 2048, 35, false));
  speaker_service_stop_ui();
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStatePlaying);
  speaker_service_stop();
  cl_assert(speaker_service_play_chime_resource(123));
  cl_assert(!speaker_service_play_ui_pcm(pcm, 2048, 35, false));
}

void test_speaker_service__ui_mute_dnd_and_volume(void) {
  static int16_t pcm[2048];
  s_cap = 50;
  cl_assert(speaker_service_play_ui_pcm(pcm, 2048, 60, false));
  cl_assert_equal_i(s_volume, 30);
  cl_assert(speaker_service_play_ui_pcm(pcm, 2048, 60, true));
  cl_assert_equal_i(s_volume, 60);
  s_dnd = true;
  prv_pump_until_idle();
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStateIdle);
  cl_assert(!speaker_service_play_ui_pcm(pcm, 2048, 60, true));
  s_dnd = false;
  s_muted = true;
  cl_assert(!speaker_service_play_ui_pcm(pcm, 2048, 60, true));
  s_muted = false;
  cl_assert(!speaker_service_play_ui_pcm(NULL, 2048, 60, false));
  cl_assert(!speaker_service_play_ui_pcm(pcm, 0, 60, false));
  cl_assert(!speaker_service_play_ui_pcm(pcm, 2048, 101, false));
}
