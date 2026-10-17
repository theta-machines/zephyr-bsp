# Copyright 2026 Theta Machines
# SPDX-License-Identifier: Apache-2.0

if(CONFIG_NXP_IMXRT_BOOT_HEADER)
    zephyr_library()
    zephyr_compile_definitions(XIP_BOOT_HEADER_ENABLE=1)
    zephyr_library_sources(flexspi_nor_config.c)
endif()
