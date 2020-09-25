#!/bin/bash
set -e
../openssl-1.1.1e/config --prefix=/usr
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $LFSCTEST = 1 ] ) ; then
    make test
  fi
  if ( [ $? = 0 ] ) ; then
    find . -type f -executable -exec strip --strip-debug '{}' \;
    if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
