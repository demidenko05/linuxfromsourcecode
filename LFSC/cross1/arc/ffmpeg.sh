#!/bin/bash
set -e
./configure --prefix=/usr --enable-gpl --enable-cross-compile --sysroot=$LFSC \
--cc="$LFSC_HOST-gcc" --cxx="$LFSC_HOST-g++" \
--ld="$LFSC_HOST-ld" --ar="$LFSC_HOST-ar"
# --enable-libx264 --enable-libpulse --enable-libass
exit 0

if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
