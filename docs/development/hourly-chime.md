# Hourly chime

On speaker-equipped watches, open **Settings → Date & Time**:

- **Hourly Chime**: On by default. This controls the sound independently of the
  existing hourly vibration setting.
- **Chime Interval**: 1 hour (default) or 30 minutes, aligned to :00 / :30.
- **Chime Start / Chime End**: local-time window, inclusive start and exclusive
  end. The default is 10:00–00:00: hourly playback ends at 23:00, or 23:30 with
  the half-hour interval. Overnight windows work; equal endpoints mean all day.

The default recording is the complete watchOS `HourlyChime_Haptic.caf`, including
its decay tail. See the audio [provenance and conversion](../../resources/normal/base/audio/NOTICE.md).

Quiet Time suppresses the chime unconditionally, even if its separate speaker
mute option is off. Manual/scheduled/smart Quiet Time share the same active-state
check. Global speaker mute, volume zero, low-power mode and firmware updates
also suppress playback. The sound uses the existing speaker volume setting.
It does not wake the display or trigger a vibration. Existing hourly vibrations
keep their own settings.

The existing clock minute callback checks the cached schedule: there is no new
polling timer, radio operation, or periodic settings write. Audio is queued only
at matching boundaries and is rechecked before playback. Delays of five seconds
or more are skipped, not replayed. Duplicate callbacks in the same UTC minute
are ignored. After time changes the current local time determines eligibility;
the two occurrences of a repeated DST hour are distinct UTC boundaries.

Playback reads at most 1 KiB per DMA refill into the existing speaker buffer.
It never loads the whole 135,598-byte recording into RAM. After all 67,799 samples,
the existing 80 ms output drain runs before powering down. Quiet Time or mute
activated during playback stops it at the next refill. Existing audio is never
interrupted; higher-priority alerts can interrupt the chime.

The setting and audio resource are compiled only for speaker-equipped normal
firmware. Speakerless models retain their existing hourly vibration behavior.
Actual battery consumption and physical speaker quality require a watch test;
emulator output and allocation/timer checks cannot measure battery life.

## Regression tests

`test_hourly_chime` covers defaults, half hours, overnight/all-day windows,
persistence, invalid settings, failed writes, quiet/muted/busy states, delayed
queues, clock changes and duplicate callbacks. `test_speaker_service` checks a
recording larger than the track sample limit, every source sample including its
tail, drain padding, interruptions, invalid resources and read failures.
