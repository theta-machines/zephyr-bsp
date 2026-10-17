# Copyright 2026 Theta Machines
# SPDX-License-Identifier: Apache-2.0

from pyocd.probe.pydapaccess import DAPAccess

def set_boot_mode(mode):
    # BOOT_MODE Command ID (0xA0 - 0x80 = 0x20)
    COMMAND_ID = 0x20

    response = probe._link.vendor(COMMAND_ID, [mode])

    status = response[1]
    if(status):
        raise RuntimeError(f"BOOT_MODE returned {status}")



def will_connect():
    # Set BOOT_MODE to "serial downloader" mode (0x01)
    set_boot_mode(0x01)



def did_disconnect():
    # Set BOOT_MODE to "internal boot" mode (0x02)
    set_boot_mode(0x02)
