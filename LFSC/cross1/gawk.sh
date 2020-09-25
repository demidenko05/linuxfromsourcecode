#!/bin/bash
mkdir -pv ../arcla/lib
mkdir -pv ../arcla/usr/lib
mv $LFSC/lib/*.la ../arcla/lib
mv $LFSC/usr/lib/*.la ../arcla/usr/lib
set -e
../gawk-5.0.1/configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr --with-gnu-ld
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
