#!/bin/bash
#d.run - ncurses
set -e
../util-linux-2.35/configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr --disable-makeinstall-chown \
--disable-makeinstall-setuid --disable-nologin --without-python --with-gnu-ld --with-sysroot=$LFSC
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      #?bash $LFSC_HOME/LFSC/cross1/utillinux1.sh
      exit 0
    fi
  fi
fi
exit 1
