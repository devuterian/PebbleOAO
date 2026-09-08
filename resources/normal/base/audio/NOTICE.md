# Hourly chime audio

`hourly_chime.pcm` is derived from the user-supplied Apple watchOS firmware
`Watch6,6_26.6_23U67_Restore.ipsw` (build 23U67).

Source: `System/Library/Audio/UISounds/nano/HourlyChime_Haptic.caf`.
The recording is Apple content, not Apache-2.0-licensed PebbleOS source code.
No ownership or relicensing of the recording is claimed by this project.

The complete recording is retained, including its original leading silence and
decay tail. Conversion only resamples to the speaker's native 16 kHz rate and
writes mono signed 16-bit little-endian PCM. No trim, fade, normalization, or
speed change is applied. The output has 67,799 samples
(4.2374375 seconds); playback adds the existing 80 ms hardware drain padding.

Reproduce with FFmpeg:

```sh
ffmpeg -v error -i HourlyChime_Haptic.caf -ac 1 -ar 16000 -f s16le hourly_chime.pcm
```

SHA-256:

- Source CAF: `74d032776cc7f15e9402a2e77c6549908befdd4eb818ecc3d6a65bc8c36583b8`
- Output PCM: `4c183d6c9f76b3599a2e453ad3b5172b85f1993171ebbf76f3671f786a0821c5`
