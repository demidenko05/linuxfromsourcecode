#!/bin/bash
set -e
../util-linux-2.35/configure --disable-static --prefix=/usr --disable-makeinstall-chown --disable-makeinstall-setuid \
--disable-nologin --with-gnu-ld --without-python
#TODO python gives error relocation R_X86_64_32 against...
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $LFSCTEST = 1 ] ) ; then
    make check
  fi
  if ( [ $? = 0 ] ) ; then
    if test "$(id -u)" = "0"; then sh $LFSC_HOME/LFSC/native/utillinux-inst.sh; else su -c "sh $LFSC_HOME/LFSC/native/utillinux-inst.sh"; fi
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
