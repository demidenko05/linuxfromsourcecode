#!/bin/bash
set -e
../kmod-27/configure --disable-static --prefix=/usr --with-gnu-ld --with-xz --with-zlib
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  #26 without tsest
  if ( [ $? = 0 ] ) ; then
    if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
