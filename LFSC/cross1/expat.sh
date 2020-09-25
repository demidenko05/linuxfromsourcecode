#!/bin/bash
#d.build docbook2x deb 2.2.0 ver but 2.2.1 ok
set -e
#prefix usr/local by default
./configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr --with-gnu-ld --with-sysroot=$LFSC
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
