# Marie firmware for Pebble Time 2

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
