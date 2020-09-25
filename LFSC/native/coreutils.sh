#!/bin/bash
set -e
if test "$(id -u)" = "0"; then
 lfscadd="FORCE_UNSAFE_CONFIGURE=1";
fi
../coreutils-8.31/configure --disable-static --prefix= --includedir=/usr/include --datarootdir=/usr/share --libexecdir=/usr/libexec \
--enable-install-program=arch,coreutils,hostname --with-gnu-ld $lfscadd
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
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
fi
exit 1
