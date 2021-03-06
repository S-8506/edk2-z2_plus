#!/bin/bash
# based on the instructions from edk2-platform
set -e
. build_common.sh
# not actually GCC5; it's GCC7 on Ubuntu 18.04.
GCC5_ARM_PREFIX=arm-linux-gnueabihf- build -s -n 0 -a ARM -t GCC5 -p XiaomiMIXPkg/XiaomiMIXPkg.dsc
gzip -c < workspace/Build/XiaomiMIXPkg/DEBUG_GCC5/FV/XIAOMIMIXPKG_UEFI.fd >uefi_image
cat lithium.dtb >>uefi_image
abootimg --create uefi.img -k uefi_image -r ramdisk-null -f bootimg.cfg