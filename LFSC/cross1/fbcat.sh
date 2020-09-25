#!/bin/bash
set -e
make -j$NCORES
if ( [ $? = 0 ] ) ; then
  make PREFIX=/usr DESTDIR=$LFSC install
  if ( [ $? = 0 ] ) ; then
    exit 0
  fi
fi
exit 1
