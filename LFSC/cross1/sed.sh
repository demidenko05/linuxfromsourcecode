#!/bin/bash
set -e
../sed-4.8/configure --disable-static --prefix=/usr --build=$LFSC_BUILD --host=$LFSC_HOST --with-gnu-ld
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      ln -svf ../usr/bin/sed $LFSC/bin/sed
      exit 0
    fi
  fi
fi
exit 1
