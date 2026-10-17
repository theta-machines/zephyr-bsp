# Copyright 2026 Theta Machines
# SPDX-License-Identifier: Apache-2.0

set(CMSIS_PACK ${ZEPHYR_THETAMACHINES_MODULE_DIR}/zephyr/blobs/NXP.MIMXRT1171_DFP.26.09.00.pack)

if(NOT EXISTS ${CMSIS_PACK})
    message(WARNING "pyOCD pack missing; run: `west blobs fetch thetamachines`")
endif()

board_runner_args(
    pyocd
    "--target=MIMXRT1171DVMAB"
    "--tool-opt=--script=${CMAKE_CURRENT_LIST_DIR}/pyocd_user.py"
    "--tool-opt=--pack=${CMSIS_PACK}"
    "--tool-opt=-Oload.post_reset=off"
    "--tool-opt=-Oresume_on_disconnect=false"
    "--tool-opt=--log-level=pyocd.board.mbed_board=error"
)

include(${ZEPHYR_BASE}/boards/common/pyocd.board.cmake)
