#!/bin/bash
set -e
./configure --prefix=/usr
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    find . -type f -executable -exec strip --strip-debug '{}' \;
    make DESTDIR=$LFSC install
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
