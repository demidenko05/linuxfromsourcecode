#!/bin/bash
set -e
make mrproper
cp /boot/config-5.5.11 .config
nano .config
make menuconfig
nano .config
make -j$NCORES all
if test "$(id -u)" = "0"; then sh ../../kerninst1.sh; else su -c "sh ../../kerninst1.sh"; fi
if ( [ $? = 0 ] ) ; then
  exit 0
fi
exit 1
