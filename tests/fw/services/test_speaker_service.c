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
static uint32_t s_driver_space;
static int s_volume;
static int16_t s_output[4096];
static unsigned s_output_count;
static int16_t s_block_first;
static int32_t s_block_peak;
static unsigned s_volume_writes;

void audio_init(AudioDevice *device) {
}

void audio_start(AudioDevice *device, AudioTransCB cb) {
  s_trans_cb = cb;
  s_start_count++;
}

uint32_t audio_write(AudioDevice *device, void *buf, uint32_t size) {
  const int16_t *samples = buf;
  const uint32_t num_samples = size / sizeof(int16_t);
  if (num_samples > 0) {
    s_block_first = samples[0];
  }
  s_block_peak = 0;
  for (uint32_t i = 0; i < num_samples; i++) {
    int32_t magnitude = samples[i] < 0 ? -(int32_t)samples[i] : samples[i];
    if (magnitude > s_block_peak) {
      s_block_peak = magnitude;
    }
    if (samples[i] != 0) {
      s_nonzero_samples++;
    }
  }
  for (uint32_t i = 0; i < num_samples && s_output_count < 4096; ++i) {
    s_output[s_output_count++] = samples[i];
  }
  s_samples_written += num_samples;
  return s_driver_space;
}

void audio_set_volume(AudioDevice *device, int volume) {
  s_volume = volume;
  ++s_volume_writes;
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
  }
}

void test_speaker_service__initialize(void) {
  fake_system_task_callbacks_cleanup();
  s_dnd = false;
  s_volume_writes = 0;
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
  s_driver_space = 4096;
  s_output_count = 0;
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

  cl_assert(speaker_service_play_tone(1000, duration_ms, 0 /* sine */, 0 /* full velocity */,
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

void test_speaker_service__owned_stream_cannot_write_or_stop_a_preempting_stream(void) {
  const int16_t samples[] = {100, -100};
  cl_assert(speaker_service_stream_open_owned(SpeakerPriorityNotification, 30,
                                              SpeakerPcmFormat_8kHz_16bit, PebbleTask_BTHCI));
  cl_assert_equal_i(speaker_service_stream_write_owned(PebbleTask_BTHCI, samples, sizeof(samples)),
                    sizeof(samples));
  cl_assert(speaker_service_stream_open_owned(SpeakerPriorityCritical, 30,
                                              SpeakerPcmFormat_8kHz_16bit, PebbleTask_KernelMain));
  cl_assert_equal_i(speaker_service_stream_write_owned(PebbleTask_BTHCI, samples, sizeof(samples)),
                    0);
  speaker_service_stop_for_task(PebbleTask_BTHCI);
  speaker_service_stream_close_owned(PebbleTask_BTHCI);
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStatePlaying);
  cl_assert_equal_i(
      speaker_service_stream_write_owned(PebbleTask_KernelMain, samples, sizeof(samples)),
      sizeof(samples));
}

void test_speaker_service__refill_completes_in_driver_callback(void) {
  cl_assert(speaker_service_stream_open(SpeakerPriorityApp, 30, SpeakerPcmFormat_16kHz_16bit));
  int16_t samples[512];
  for (unsigned i = 0; i < 512; ++i) {
    samples[i] = 100;
  }
  cl_assert_equal_i(speaker_service_stream_write(samples, sizeof(samples)), sizeof(samples));
  uint32_t free_size = sizeof(samples) - 2;
  s_trans_cb(&free_size);
  cl_assert_equal_i(s_samples_written, 0);
  free_size = sizeof(samples);
  s_trans_cb(&free_size);
  cl_assert_equal_i(s_samples_written, 512);
  cl_assert_equal_i(s_nonzero_samples, 512);
  cl_assert_equal_i(list_count(s_system_task_callback_head), 0);
}

void test_speaker_service__live_stream_waits_for_a_whole_refill(void) {
  cl_assert(speaker_service_stream_open_realtime_owned(
      SpeakerPriorityNotification, 50, SpeakerPcmFormat_8kHz_16bit, PebbleTask_BTHCI));
  int16_t samples[256] = {100};
  uint32_t free_size = 4096;
  s_trans_cb(&free_size);
  cl_assert_equal_i(s_samples_written, 0);
  cl_assert_equal_i(speaker_service_stream_write_owned(PebbleTask_BTHCI, samples, 480), 480);
  s_trans_cb(&free_size);
  cl_assert_equal_i(s_samples_written, 0);
  cl_assert_equal_i(speaker_service_stream_write_owned(PebbleTask_BTHCI, samples, 32), 32);
  cl_assert_equal_i(s_samples_written, 512);
  s_trans_cb(&free_size);
  cl_assert_equal_i(s_samples_written, 512);
}

void test_speaker_service__live_stream_retries_driver_backpressure(void) {
  cl_assert(speaker_service_stream_open_realtime_owned(
      SpeakerPriorityNotification, 50, SpeakerPcmFormat_16kHz_16bit, PebbleTask_BTHCI));
  int16_t samples[512];
  for (unsigned i = 0; i < 512; ++i) {
    samples[i] = 100;
  }
  s_driver_space = 0;
  cl_assert_equal_i(speaker_service_stream_write_owned(PebbleTask_BTHCI, samples, sizeof(samples)),
                    sizeof(samples));
  cl_assert_equal_i(s_samples_written, 0);
  s_driver_space = sizeof(samples);
  s_trans_cb(&s_driver_space);
  cl_assert_equal_i(s_samples_written, 512);
  cl_assert_equal_i(s_nonzero_samples, 512);
}

void test_speaker_service__live_stream_close_drains_a_partial_refill(void) {
  cl_assert(speaker_service_stream_open_realtime_owned(
      SpeakerPriorityNotification, 50, SpeakerPcmFormat_8kHz_16bit, PebbleTask_BTHCI));
  int16_t samples[20] = {100};
  cl_assert_equal_i(speaker_service_stream_write_owned(PebbleTask_BTHCI, samples, sizeof(samples)),
                    sizeof(samples));
  speaker_service_stream_close_owned(PebbleTask_BTHCI);
  prv_pump_until_idle();
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStateIdle);
  cl_assert_equal_i(s_samples_written, 40 + 6 + DRAIN_SAMPLES);
}

void test_speaker_service__live_stream_close_preserves_already_queued_audio(void) {
  cl_assert(speaker_service_stream_open_realtime_owned(
      SpeakerPriorityNotification, 50, SpeakerPcmFormat_8kHz_16bit, PebbleTask_BTHCI));
  int16_t samples[256] = {100};
  speaker_service_stream_write_owned(PebbleTask_BTHCI, samples, sizeof(samples));
  cl_assert_equal_i(s_samples_written, 512);
  speaker_service_stream_close_owned(PebbleTask_BTHCI);
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStateDraining);
  prv_pump_until_idle();
  cl_assert_equal_i(s_samples_written, 512 + 6 + DRAIN_SAMPLES);
}

#define RESAMPLE_INPUT_SAMPLES 600

static int16_t prv_cubic_midpoint(int16_t s0, int16_t s1, int16_t s2, int16_t s3) {
  int32_t v = -(int32_t)s0 + 9 * (int32_t)s1 + 9 * (int32_t)s2 - (int32_t)s3;
  return (int16_t)((v + 8) >> 4);
}

// Reference 2x upsampler: two input samples of delay, then each input sample
// followed by the cubic midpoint towards the next one.
static void prv_reference_upsample(const int16_t *input, unsigned count, int16_t *output) {
  for (unsigned i = 0; i < count; ++i) {
    int16_t taps[4];
    for (unsigned k = 0; k < 4; ++k) {
      taps[k] = (i + k >= 3) ? input[i + k - 3] : 0;
    }
    output[2 * i] = taps[1];
    output[2 * i + 1] = prv_cubic_midpoint(taps[0], taps[1], taps[2], taps[3]);
  }
}

static void prv_resample_partition(const int16_t *input, unsigned partition, int16_t *output) {
  s_output_count = 0;
  cl_assert(speaker_service_stream_open(SpeakerPriorityApp, 50, SpeakerPcmFormat_8kHz_16bit));
  for (unsigned offset = 0; offset < RESAMPLE_INPUT_SAMPLES;) {
    unsigned count =
        partition < RESAMPLE_INPUT_SAMPLES - offset ? partition : RESAMPLE_INPUT_SAMPLES - offset;
    cl_assert_equal_i(speaker_service_stream_write(input + offset, count * 2), count * 2);
    uint32_t space = 4096;
    s_trans_cb(&space);
    offset += count;
  }
  cl_assert_equal_i(s_output_count, 2 * RESAMPLE_INPUT_SAMPLES);
  memcpy(output, s_output, 2 * RESAMPLE_INPUT_SAMPLES * sizeof(int16_t));
  speaker_service_stop();
}

void test_speaker_service__upsampling_does_not_depend_on_packet_boundaries(void) {
  int16_t input[RESAMPLE_INPUT_SAMPLES];
  int16_t expected[2 * RESAMPLE_INPUT_SAMPLES], actual[2 * RESAMPLE_INPUT_SAMPLES];
  for (unsigned i = 0; i < RESAMPLE_INPUT_SAMPLES; ++i) {
    input[i] = (i * 977 % 24000) - 12000;
  }
  prv_reference_upsample(input, RESAMPLE_INPUT_SAMPLES, expected);

  const unsigned partitions[] = {1, 7, 30, 127, 256};
  for (unsigned i = 0; i < sizeof(partitions) / sizeof(partitions[0]); ++i) {
    prv_resample_partition(input, partitions[i], actual);
    cl_assert_equal_m(actual, expected, sizeof(expected));
  }
}

void test_speaker_service__upsampling_close_flushes_the_last_sample_and_filter_tail(void) {
  cl_assert(speaker_service_stream_open(SpeakerPriorityApp, 50, SpeakerPcmFormat_8kHz_16bit));
  const int16_t input[] = {0, 0, 16000};
  cl_assert_equal_i(speaker_service_stream_write(input, sizeof(input)), sizeof(input));
  uint32_t space = 4096;
  s_trans_cb(&space);
  speaker_service_stream_close();
  prv_pump_until_idle();
  const int16_t expected[] = {0, 0, 0, 0, 0, -1000, 0, 9000, 16000, 9000, 0, -1000};
  cl_assert_equal_m(s_output, expected, sizeof(expected));
  cl_assert_equal_i(s_samples_written, sizeof(expected) / sizeof(expected[0]) + DRAIN_SAMPLES);
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStateIdle);
}

// An underrun must play out the delayed samples and filter tail before going
// silent, rather than holding them until the next packet arrives.
void test_speaker_service__upsampling_underrun_runs_silence_through_the_filter(void) {
  cl_assert(speaker_service_stream_open(SpeakerPriorityApp, 50, SpeakerPcmFormat_8kHz_16bit));
  const int16_t input[] = {0, 0, 16000};
  cl_assert_equal_i(speaker_service_stream_write(input, sizeof(input)), sizeof(input));
  uint32_t space = 4096;
  s_trans_cb(&space);
  cl_assert_equal_i(s_samples_written, 6);

  s_trans_cb(&space);
  cl_assert_equal_i(s_samples_written, 6 + 512);
  const int16_t expected[] = {0, 0, 0, 0, 0, -1000, 0, 9000, 16000, 9000, 0, -1000, 0, 0};
  cl_assert_equal_m(s_output, expected, sizeof(expected));
  cl_assert_equal_i(s_nonzero_samples, 5);
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStatePlaying);
}

void test_speaker_service__stream_write_keeps_16bit_samples_aligned(void) {
  cl_assert(speaker_service_stream_open(SpeakerPriorityApp, 50, SpeakerPcmFormat_8kHz_16bit));
  const uint8_t bytes[3] = {0};
  cl_assert_equal_i(speaker_service_stream_write(bytes, 3), 2);
  cl_assert_equal_i(speaker_service_stream_write(bytes, 1), 0);
  speaker_service_stop();

  cl_assert(speaker_service_stream_open(SpeakerPriorityApp, 50, SpeakerPcmFormat_8kHz_8bit));
  cl_assert_equal_i(speaker_service_stream_write(bytes, 3), 3);
}

void test_speaker_service__volume_change_cannot_affect_a_preempting_stream(void) {
  cl_assert(speaker_service_stream_open_owned(SpeakerPriorityNotification, 100,
                                              SpeakerPcmFormat_8kHz_16bit, PebbleTask_BTHCI));
  speaker_service_set_volume_owned(PebbleTask_BTHCI, 40);
  cl_assert_equal_i(s_volume, 40);
  cl_assert(speaker_service_stream_open_owned(SpeakerPriorityCritical, 80,
                                              SpeakerPcmFormat_8kHz_16bit, PebbleTask_KernelMain));
  speaker_service_set_volume_owned(PebbleTask_BTHCI, 20);
  cl_assert_equal_i(s_volume, 80);
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

void test_speaker_service__chime_preview_replaces_ui_and_uses_selected_level(void) {
  static const int16_t pcm[2048];
  s_cap = 50;
  cl_assert(speaker_service_play_ui_pcm(pcm, 2048, 35, false));
  cl_assert(speaker_service_preview_chime_resource(123, 60));
  cl_assert_equal_i(speaker_service_get_state(), SpeakerStatePlaying);
  cl_assert_equal_i(s_volume, 30);
  cl_assert_equal_i(s_stop_count, 1);

  speaker_service_stop();
  cl_assert(speaker_service_play_tone(440, 1000, 0, 0, SpeakerPriorityApp, 100));
  cl_assert(!speaker_service_preview_chime_resource(123, 60));
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
  s_volume_writes = 0;
  s_muted = true;
  cl_assert(!speaker_service_play_ui_pcm(pcm, 2048, 60, true));
  s_muted = false;
  cl_assert(!speaker_service_play_ui_pcm(NULL, 2048, 60, false));
  cl_assert(!speaker_service_play_ui_pcm(pcm, 0, 60, false));
  cl_assert(!speaker_service_play_ui_pcm(pcm, 2048, 101, false));
}

void test_speaker_service__ui_pending_replacement_keeps_audible_predecessor(void) {
  static int16_t old[2048], next[2048];
  for (unsigned i = 0; i < 2048; ++i) {
    old[i] = 1000;
    next[i] = -1000;
  }
  cl_assert(speaker_service_play_ui_pcm(old, 2048, 35, false));
  unsigned volume_writes = s_volume_writes;
  cl_assert(speaker_service_play_ui_pcm(next, 2048, 35, false));
  cl_assert(speaker_service_play_ui_pcm(next, 2048, 35, false));
  uint32_t free_size = 4096;
  s_trans_cb(&free_size);
  fake_system_task_callbacks_invoke_pending();
  cl_assert_equal_i(s_block_first, 1000);
  cl_assert(s_block_peak <= 1000);
  cl_assert_equal_i(s_volume_writes, volume_writes);
  cl_assert_equal_i(s_start_count, 1);
}
