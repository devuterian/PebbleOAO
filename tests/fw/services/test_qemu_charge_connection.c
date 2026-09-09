/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */
#include "clar.h"
#include "pbl/services/battery/battery_curve.h"
#include "pbl/drivers/battery.h"
#include "pbl/drivers/qemu/qemu_serial.h"
#include "pbl/drivers/qemu/qemu_settings.h"
#include "stubs_logging.h"
uint32_t qemu_setting_get(QemuSetting setting) { return 1; }
uint32_t battery_curve_lookup_voltage_by_percent(uint32_t percent, bool charging) { return 4000; }
void battery_state_reset_filter(void) {}
void battery_state_handle_connection_event(bool connected) {}
extern void qemu_battery_msg_callback(const uint8_t *data, uint32_t len);

void test_qemu_charge_connection__charger_disable_preserves_usb_connection(void) {
  QemuProtocolBatteryHeader packet = { .battery_pct = 80, .charger_connected = true };
  qemu_battery_msg_callback((uint8_t *)&packet, sizeof(packet));
  battery_set_charge_enable(false);
  cl_assert(battery_is_usb_connected_impl());
  cl_assert(!battery_charge_controller_thinks_we_are_charging_impl());
  battery_set_charge_enable(true);
  cl_assert(battery_is_usb_connected_impl());
  cl_assert(battery_charge_controller_thinks_we_are_charging_impl());
}
