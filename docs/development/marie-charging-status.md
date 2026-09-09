# Time 2 charging status

The custom charging dialog is enabled only for obelix and its qemu_emery preview.
The first line shows model SOC as `53.253%`; the second shows battery-side power
and estimated time, for example `0.52W / 1시간 3분 남음`. Decimal places are a
presentation choice, not a claim of 0.001% measurement accuracy.

While the dialog is visible, a three-second timer requests an asynchronous
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
- Four targeted CTest suites passed: charge estimate, charge limit, and both
  battery UI state-machine configurations. Cases cover 79.999% versus 80%,
  77.001% versus 77%, insufficient gain/time, falling SOC, full-charge estimates,
  retention of the charge dialog without repeated vibration, and unplugging.
- Actual QEMU rendering was inspected. The original 42px font truncated
  `100.000%`; it was replaced with LECO 36 for the final layout.
- Preview screenshots with specific decimal SOC, wattage, and duration use
  injected test values. QEMU does not measure real charging power or validate
  time-to-full accuracy. Real PMIC readings, estimator accuracy, and the cost
  of three-second sampling still need an on-watch charging session.

Local evidence is in
`/Volumes/marie-4TB2/codex-pebble-health-preview/charge-screens/` and the
`charge-*.log` files in its parent directory. This change has not been released
or installed on the user's watch.
