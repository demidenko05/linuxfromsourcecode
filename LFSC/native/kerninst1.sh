#!/bin/bash
set -e
make modules_install
if ( [ $? = 0 ] ) ; then
  #make INSTALL_MOD_PATH= firmware_install
  if ( [ $? = 0 ] ) ; then
    cp -v arch/x86/boot/bzImage /boot/vmlinuz-5.5.11
    cp -v System.map /boot/System.map-5.5.11
    cp -v .config /boot/config-5.5.11
    exit 0
  fi
fi
exit 1
