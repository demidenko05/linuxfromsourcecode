#!/bin/bash
set -e
./configure --disable-static --prefix= --with-gnu-ld --includedir=/usr/include --datarootdir=/usr/share --libexecdir=/usr/libexec
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    if ( [ $LFSCTEST = 1 ] ) ; then
      make check
    fi
    if ( [ $? = 0 ] ) ; then
      find . -type f -executable -exec strip --strip-debug '{}' \;
      if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
