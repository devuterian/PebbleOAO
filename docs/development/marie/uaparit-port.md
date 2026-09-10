# uaparit Time 2 integration

Source: https://github.com/uaparit/PebbleOS/tree/v4.36.2-ua1.4

Pinned source: `2f14eeee2` on `v4.36.2-ua-branch`. The integration keeps
PebbleOAO's v4.37.0 base. It does not replace it with the older v4.36.2 base.
The source files retain their Apache-2.0 notices. Credit: uaparit Basstardo.

## Feature audit

- Theme integration: `96114eae6^..140a739af`; enables the accent picker,
  background selection, inverted highlight, settings icons, system-icon tint,
  and refreshes settings/status/option menus after preference changes.
- Background selection uses the existing DarkMode preference. Ambient and
  scheduled modes remain available; there is no second competing dark flag.
  Choosing a fixed background selects DarkModeOff/On, respectively.
- Launcher text and row sizing already follow PebbleOAO's content size.
  Preserve its compact rows and Korean font mapping rather than replace them
  with the source fork's fixed English-oriented dimensions.
- `335a845a8`: port battery/charging icon resizing and centering; adapt the
  font lookup to the existing launcher. No new icon timer is introduced.
- `3c47a9902`: watchface-picker fonts follow the preferred content size.
- `7b021f776`: option-menu fonts and row styles follow content size.
- `fe1a89f16`: Time 2 notification fonts, Clear All and empty-state fonts
  already follow content size in this fork; retain the compact row layout.
- `3f2151ed9`, `94ee42201`, `4aa8eef6a`: alarm limit, Bluetooth pairing and
  Send Text empty-state fonts follow content size; pairing text gets the
  available screen height.
- `dc9fb63ee`: health cards wrap in either direction, independent of launch
  reason. The user explicitly requested this after initially excluding it.
- The seven text-size backports in ua1.2 are already covered by the newer
  v4.37.0 base and this fork's larger Korean menu work.
- The historical buffered DLS heartbeat experiment was reverted in ua1.4.
  It is intentionally not revived. Third-party app bitmap icons cannot be
  recolored by the system-icon tint path.

## Validation

- Obelix PVT release compilation and resource-size check.
- Host suite: 340/340 passed. After adapting launcher battery icon scaling,
  reran launcher, health-card and option-menu tests: 8/8 passed.
- qemu_emery: red/light, red/dark, inverted/light and inverted/dark, covering
  launcher, settings, watchface picker, notifications, themes and accent picker.
- Korean, larger content size. The untranslated plain Default entry found in
  the accent picker was added to the Korean catalog before final screenshots.
- Health test data enabled only in the emulator: activity, sleep, heart rate,
  activity; two complete loops have matching rendered cards.
- The emulator has no physical health, charging, Bluetooth or touch hardware.
  These checks do not certify physical-device stability or sensor accuracy.
- Existing automatic dark mode and device-specific features are retained.
  No claim is made about themes inside third-party applications.
