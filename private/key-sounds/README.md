# Private Time 2 key-sound preview

Local preview only; do not publish the supplied audio or this branch as a release.
Build with `CONFIG_KEY_SOUNDS=y` on `obelix@pvt` (both slots) or `qemu_emery`.
The option defaults off at build time, and key sounds default off in settings.

The user supplied the nine WAVs from their BlackUI/pebble folder. `prepare.py`
converts copies to mono PCM16 at 16 kHz, removes leading silence while retaining
2 ms before the first audible sample, and adds a 2 ms fade-in / 8 ms fade-out.
Original hashes and trim amounts are in `processing.json`. No original is edited.
Generated static PCM occupies code flash, not the nearly full resource bank.

- menu: open the launcher
- menu_navigate: move a menu selection
- menu_select: enter an app or submenu
- backkey: go back one screen
- close: return to the watchface
- setting_applyed: select an option / apply an inline setting
- volume_adjust: preview a volume setting
- battery_low: show a low-battery warning (status sounds enabled)
- dnd_off: manually turn off DND (status sounds enabled)

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
