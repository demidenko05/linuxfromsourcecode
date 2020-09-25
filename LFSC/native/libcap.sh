#!/bin/bash
#CC="gcc $CFLAGS" 
set -e
make
if ( [ $? = 0 ] ) ; then
  if ( [ $LFSCTEST = 1 ] ) ; then
    if test "$(id -u)" = "0"; then make sudotest; else make test; fi
  fi
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
  if ( [ $? = 0 ] ) ; then
    exit 0
  fi
fi
exit 1
