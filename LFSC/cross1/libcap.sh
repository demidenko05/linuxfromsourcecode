#!/bin/bash
set -e
if ( [ $? = 0 ] ) ; then
  make
  find . -type f -executable -exec strip --strip-debug '{}' \;
  make DESTDIR=$LFSC install
  if ( [ $? = 0 ] ) ; then
    exit 0
  fi
fi
exit 1
