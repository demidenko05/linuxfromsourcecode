#!/bin/bash
#d.run utillinux
set -e
../e2fsprogs-1.45.5/configure --disable-static --prefix=/usr --build=$LFSC_BUILD --host=$LFSC_HOST --with-gnu-ld \
--enable-elf-shlibs --disable-libblkid --disable-libuuid --disable-fsck --disable-uuidd
if ( [ $? = 0 ] ) ; then
  make LDFLAGS="-luuid $LDFLAGS" -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip install-libs
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
