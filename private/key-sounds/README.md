# Time 2 key sounds

The user approved publishing the test 3 implementation in the Ice Cream prerelease.
Build with `CONFIG_KEY_SOUNDS=y` on `obelix@pvt` (both slots) or `qemu_emery`.
The build option defaults on for Time 2; key sounds still default off in settings.

The user supplied the WAVs from their BlackUI/pebble folder. `prepare.py`
converts copies to mono PCM16 at 16 kHz, removes inaudible head and tail while
retaining short padding, and adds a 2 ms fade-in / 8 ms fade-out.
Original hashes and trim amounts are in `processing.json`. No original is edited.
Generated static PCM occupies code flash, not the nearly full resource bank.

- menu: open the launcher
- menu_navigate: move a menu selection
- menu_select: enter an app or submenu
- backkey: go back one screen
- close: leave the launcher for the watchface
- setting_applyed: select an option / apply an inline setting
- volume_adjust: preview a volume setting
- battery_low: show a low-battery warning (status sounds enabled)
- dnd_off: manually turn off DND (status sounds enabled)
- dialog_failed: show a user-facing progress failure (status sounds enabled)
- long press shortcut: launch a hold shortcut, except the DND shortcut

The unused `1.wav` through `9.wav` rise in pitch and suit a numeric keypad. They
are not linked because PebbleOS currently has no shared numeric-keypad event.

Key level defaults to 3, chime level to 5; both persist separately. Amplitude
levels are 10, 20, 35, 60 and 100 percent of the global speaker setting. The
global volume screen previews its proposed absolute level. Mute and DND still
apply. Key events are coalesced; rapid replacement crossfades 5 ms without
restarting the audio driver. Key sounds yield to apps, alerts and hourly chimes.
The existing 80 ms DMA drain preserves the last samples before powering down.

Validation: 340 host test targets passed, including PCM tail preservation,
rapid replacement, app/chime priority, mute/DND and volume scaling. QEMU showed
Korean settings, audible PCM output and separately retained key/chime levels
following reset. All nine original hashes and processed fade endpoints checked.
Physical speaker timbre, maximum comfortable volume and power use still require
checking on the user's watch.

## Test 2: transition clicks

Use signed weights when crossfading signed PCM. Unsigned arithmetic wrapped
negative mixtures into large impulses. Preserve the audible predecessor when
multiple requests arrive before DMA refill, and avoid rewriting unchanged DAC
volume. Regression tests fail with the original transition/unsigned arithmetic
and pass with the fix. Amplifier power sequencing is unchanged; analog pops
still require physical listening to distinguish from PCM transition clicks.

## Test 3: shared start/stop transients

Hourly chimes do not use UI crossfades. Keep the PA disabled while starting
the DAC, allow 2 ms of settling with the existing silent DMA buffer, then
send the original amplifier mode pulses. Disable PA before stopping the DAC.
The real driver passes a host call-order harness and both hardware slots
compile. Actual analog click reduction must be checked on the watch.

## Ice Cream prerelease

The public ver009 build includes test 3 unchanged, with key-sound support
built in by default on Time 2 and disabled in user settings until enabled.
The complete host suite passed (340 targets), the real-driver sequence
harness passed, and the release includes four QEMU settings screenshots.
The companion APK is byte-identical to Honey Toast's ver017.
