#!/bin/bash
#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
function blob_fixup() {
    case "${1}" in
        vendor/lib64/camera/components/com.mi.node.watermark.so )
            $PATCHELF --add-needed "libpiex_shim.so" "${2}"
            ;;
    esac
}

if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=munch
export DEVICE_COMMON=sm8250-common
export VENDOR=xiaomi

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
