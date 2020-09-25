#!/bin/bash
#d.run: libpipeline
set -e
../gdbm-1.18/configure --disable-static --prefix=/usr --build=$LFSC_BUILD --host=$LFSC_HOST --with-gnu-ld --enable-libgdbm-compat
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
