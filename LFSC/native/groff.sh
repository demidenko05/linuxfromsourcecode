#!/bin/bash
set -e
../groff-1.22.4/configure PAGE=A4 --prefix=/usr
if ( [ $? = 0 ] ) ; then
  make
  if ( [ $LFSCTEST = 1 ] ) ; then
    make check
  fi
  if ( [ $? = 0 ] ) ; then
    if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
