# Time 2 charging status

The custom charging dialog is enabled only for obelix and its qemu_emery preview.
The custom screen shows model SOC as `53.253%`; the second shows battery-side power
and estimated time, for example `0.52W / 1시간 3분 남음`. Decimal places are a
presentation choice, not a claim of 0.001% measurement accuracy.

While a custom dialog is visible, a timer (three seconds by default) requests an asynchronous
fuel-gauge sample and displays the latest completed sample. It does not block
rendering on an ADC conversion. Requests are coalesced by the existing system
task queue. Closing the dialog stops this timer; hidden dialogs do not request
measurements. Normal background sampling is unchanged.

Power is VBAT × IBAT, using the existing nPM1300 measurements. It excludes the
watch's other loads and power-conversion losses and must not be described as
USB/charger input power. An unavailable or failed measurement shows `--W`.

The 100% estimate comes from the Nordic fuel gauge's time-to-full model. With
the 80% limit enabled, the estimate uses observed SOC gain over the current
charging interval. It requires at least three minutes and one percentage point
of gain. It does not scale the time-to-100% estimate, which includes CV taper.
Until there is sufficient data, the time line says `계산 중`. Estimates above
one day and invalid/negative full-charge estimates are not displayed. Minutes
round up. Disconnecting or interrupted measurements invalidates the sample.

At the target, the second line says `충전 완료!`. While the 80% limit is holding
the charger off below 80%, it says `완충 후 항해 중`. Charging resumes at 77%.
Time 2 uses the fractional model SOC for these limits, so integer ceiling does
not prematurely stop at 79.x% or hide the 77% threshold crossing.

## Validation

- qemu_emery firmware build: passed.
- obelix@pvt hardware-target build: passed (not installed on hardware).
- Six targeted CTest suites passed, including preferences and QEMU charger connection:
  charge estimate, charge limit, and both
  battery UI state-machine configurations. Cases cover 79.999% versus 80%,
  77.001% versus 77%, insufficient gain/time, falling SOC, full-charge estimates,
  retention of the charge dialog without repeated vibration, and unplugging.
- The large integer uses BITHAM 42 Bold and the fraction uses BITHAM 30 Black.
  At 100%, decimals are omitted. Custom layouts follow `marie-charging-layout.json`;
  its stock-mode coordinates are deliberately ignored.
- Preview screenshots with specific decimal SOC, wattage, and duration use
  injected test values. QEMU does not measure real charging power or validate
  time-to-full accuracy. Real PMIC readings, estimator accuracy, and the cost
  of three-second sampling still need an on-watch charging session.

Local evidence is in
`/Volumes/marie-4TB2/codex-pebble-health-preview/charge-screens/` and the
`charge-*.log` files in its parent directory. The Flan prerelease contains these changes; physical-watch installation and
charging measurements remain unverified.

## Display preferences

Settings > Charging offers exactly three screens: all details, original charging
screen, and icon with percentage. The original mode uses the existing SimpleDialog
and its native font, icon animation, layout, and full-charge screen; it does not
start the custom sampling timer. The other modes use the supplied layout's vertical
positions and center variable-width text so changing values remain on screen.
Power and remaining charging time form one line.

Decimal places (0–3), refresh interval (3/5/10/30/60 seconds), and the 80% limit
remain configurable. Reset restores display preferences only. Preferences use the
existing persistent shell store; arbitrary combinations from the earlier editor
are normalized to one of the three modes.


## Flan prerelease validation

Both obelix_pvt firmware slots build with CONFIG_RELEASE=y. Each resource bank
uses 1,977,128 of 2,097,152 bytes. The six focused charging CTest suites pass.

Charging icons are cloned into owned RAM before scaling because built-in PDC
resources can be mapped read-only. The previous in-place transform reproduced
an MPU fault during charging startup in QEMU. The charging sequence loops while
visible and pauses when covered; three-second value refreshes retain the reel.
Stock mode keeps the native dialog. QEMU fixture values are rendering inputs,
not measurements from a physical battery.

Companion app ver010 adds a per-watch, default-off preview channel. The tester
confirmation is required before saving it. Its APK builds and passes signature
verification; 23 firmware-related host tests pass, including persistence and
promotion from a preview to a newer stable release. The APK has not been
installed on the owner's phone in this release run.

The fixed QEMU image boots while plugged in at 53%, accepts host battery
updates, and renders the Korean custom screen. A six-second capture at 100 ms
intervals produced 60 distinct framebuffer images, confirming continuous icon
animation. Release images are actual QEMU captures with synthetic battery
percentages; unavailable power and remaining-time data are shown honestly.

Korean all-details, native stock, icon-and-percentage and 100% screens were
captured separately and assembled into the release contact sheet without
altering the captured UI. The 100% screen omits fractional digits.
