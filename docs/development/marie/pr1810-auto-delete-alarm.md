# Auto-delete one-time alarms

Source: https://github.com/coredevices/PebbleOS/pull/1810

Imported commit: `6c1bbad03325be54e5c9f2596f6b62a0caf6bfd9`

The source is licensed under Apache-2.0 and retains the repository license notices. Credit: George Ruinelli (`caco3`).

This port keeps the existing alarm sound changes, adds Korean strings, excludes both one-time modes from day pickers that do not allow them, and refreshes the scheduled weekday for both one-time modes after a clock change or reboot.
