#!/bin/bash
set -e
../readline-8.0/configure --disable-static --prefix=/usr
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    find . -type f -executable -exec strip --strip-debug '{}' \;
    if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
