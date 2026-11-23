/* SPDX-FileCopyrightText: 2026 PebbleOS contributors */
/* SPDX-License-Identifier: Apache-2.0 */
#include "clar.h"
#include <pbl/drivers/charger.h>
#include <pbl/drivers/charger/sim.h>

extern const struct pbl_charger pbl_charger_sim;

void pbl_charger_report_online_changed(const struct pbl_charger *charger) {}
const struct pbl_device_class pbl_charger_class;
int pbl_charger_dev_init(const struct pbl_device *dev) {
  return 0;
}

static void prv_get_status(enum pbl_charger_status *status) {
  cl_assert_equal_i(pbl_charger_sim.ops->get_status(&pbl_charger_sim, status), 0);
}

void test_qemu_charge_connection__charger_disable_preserves_usb_connection(void) {
  enum pbl_charger_status status;
  bool online;

  pbl_charger_sim_set(80, 4000, true);

  cl_assert_equal_i(pbl_charger_sim.ops->enable(&pbl_charger_sim, false), 0);
  cl_assert_equal_i(pbl_charger_sim.ops->is_online(&pbl_charger_sim, &online), 0);
  cl_assert(online);
  prv_get_status(&status);
  cl_assert_equal_i(status, PBL_CHARGER_STATUS_UNKNOWN);

  cl_assert_equal_i(pbl_charger_sim.ops->enable(&pbl_charger_sim, true), 0);
  prv_get_status(&status);
  cl_assert_equal_i(status, PBL_CHARGER_STATUS_CONSTANT_CURRENT);
}
