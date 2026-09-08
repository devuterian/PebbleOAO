# SPDX-FileCopyrightText: 2026 Core Devices LLC
# SPDX-License-Identifier: Apache-2.0

pbl_library()
pbl_library_sources(service.c)
pbl_service_gettext(clock service.c)

if(CONFIG_SPEAKER AND NOT CONFIG_RECOVERY_FW)
  pbl_library_sources(hourly_chime.c)
endif()
