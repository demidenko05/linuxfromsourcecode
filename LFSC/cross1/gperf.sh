#!/bin/bash
set -e
../gperf-3.1/configure --disable-static --prefix=/usr
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    #make check
    if ( [ $? = 0 ] ) ; then
      find . -type f -executable -exec strip --strip-debug '{}' \;
      make DESTDIR=$LFSC install
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
