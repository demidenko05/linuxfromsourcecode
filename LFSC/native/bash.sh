#!/bin/bash
set -e
../bash-5.0/configure  --prefix= --includedir=/usr/include --datarootdir=/usr/share \
--libexecdir=/usr/libexec --with-gnu-ld --without-bash-malloc --enable-multibyte
# --with-installed-readline
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
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
