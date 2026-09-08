# Marie firmware for Pebble Time 2

Based on stable PebbleOS **v4.37.0**. The Time 2 build includes Korean UI,
TUMBLED fonts, dark mode, an optional 80% charge limit, and six extra vibration
patterns. These ports retain the palm gesture described below.

## Korean and fonts

Select **Settings → Display → Language → 한국어** after installation. Korean is
built in for Time 2 (`obelix`) and its `qemu_emery` emulator; it is not forced as
the default language. If an older external Korean pack is installed, select the
built-in Korean entry to use the updated translations.

The translation adapts [pebble-korean-language-pack](https://github.com/devuterian/pebble-korean-language-pack)
to the current UI, including the new settings. Its CC0 notice is included with
the catalog. [TUMBLED v1.3](https://github.com/TsFreddie/TUMBLED/releases/tag/v1.3)
replaces the Korean font extension using the upstream Lite size mappings to fit
the existing resource bank. It covers 2,350 Hangul syllables and kana, including
every Hangul character in the Korean UI catalog. It does not cover every possible
Hangul syllable. All 94 compatibility jamo (including ㅋㅋ, ㅎㅎ and ㅠㅠ) are
added from Galmuri, one of TUMBLED's source families. The 36px size is scaled from 28px; Latin and
emoji retain the original system fonts. See the font directory's NOTICE.md for
coverage, attribution, and reproducible generation instructions.

## Additional settings

- **Settings → Display → Dark Mode** (under Themes in builds with color theming):
  Off, On, Ambient, or Scheduled. This ports
  [PR #1119](https://github.com/coredevices/PebbleOS/pull/1119) to the current
  system UI. Third-party apps retain their own colors.
- **Settings → System → Charge Limit (80%)**: disabled by default. This adapts
  [PR #1156](https://github.com/coredevices/PebbleOS/pull/1156), pauses charging
  at 80%, and resumes at 77% or lower. Changing the setting queues an immediate
  check; periodic checks run every 60 seconds.
- **Settings → Vibrations**: six additional patterns from
  [PR #1982](https://github.com/coredevices/PebbleOS/pull/1982): Double Pulse
  Medium, Pebble Morse, Heartbeat, Double Tap, Wave, and Imperial.

These settings have Korean labels when Korean is selected. Build and automated
test results do not replace physical-watch validation of charging, palm sensing,
ambient light, and vibration timing.

## Palm gesture

This fork adapts [upstream PR #1979](https://github.com/coredevices/PebbleOS/pull/1979).
With **Settings → Display → Backlight → Palm to watchface** enabled (the default),
covering the touchscreen with a palm turns off the backlight, dismisses ordinary
popups, and returns to the selected watchface. An already running watchface is
not restarted. Critical dialogs and alarms remain visible. System apps, factory
reset, and low-power mode are not interrupted by the return action.

Touch must be enabled. Palm detection uses the CST816's undocumented `0xAA`
gesture, observed on Time 2 by the original author; physical-device validation
is still required for this fork.

## Install

Use the **merged normal obelix_pvt `.pbz`** from this repository's firmware build
or release. It contains both firmware slots. Do not use a recovery, DVT, or
individual slot bundle for this installation.

1. Download the `.pbz` to the phone paired with your Time 2.
2. In Pebble, enable **Settings → Show debug options**.
3. Open **Devices → your watch → Firmware Update Debug → Sideload FW**.
4. Select the `.pbz` and wait for the update and reconnect to finish.
5. Check the firmware version and the **Palm to watchface** setting.

Test from the launcher, an app, a notification, and the watchface itself.
Check that a normal tap/button can wake the backlight afterwards and that
disabling the option stops the action. Confirm alarms remain visible.

This installs a custom version; it does not redirect the official mobile app's
update checks to this GitHub repository. Future custom versions can be sideloaded
in the same way. See [Building firmware](building_fw.md) for official instructions.
