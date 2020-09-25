#!/bin/bash
set -e
../grep-3.4/configure --disable-static --prefix=/usr --build=$LFSC_BUILD --host=$LFSC_HOST --with-gnu-ld --without-included-regex
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      #for systemd's autotool
      ln -svf ../usr/bin/grep $LFSC/bin/grep
      exit 0
    fi
  fi
fi
exit 1
