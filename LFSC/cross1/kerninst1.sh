#!/bin/bash
set -e
make INSTALL_MOD_PATH=$LFSC modules_install
if ( [ $? = 0 ] ) ; then
  #make INSTALL_MOD_PATH=$LFSC firmware_install
  if ( [ $? = 0 ] ) ; then
    cp -v arch/x86/boot/bzImage $LFSC/boot/vmlinuz-5.5.11
    cp -v System.map $LFSC/boot/System.map-5.5.11
    cp -v .config $LFSC/boot/config-5.5.11
    exit 0
  fi
fi
exit 1
