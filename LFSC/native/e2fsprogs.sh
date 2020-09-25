#!/bin/bash
#d.run utillinux
set -e
../e2fsprogs-1.45.5/configure --disable-static --prefix=/usr --build=$LFSC_BUILD --host=$LFSC_HOST --with-gnu-ld \
--enable-elf-shlibs --disable-libblkid --disable-libuuid --disable-fsck --disable-uuidd
if ( [ $? = 0 ] ) ; then
  #TODO
  make LDFLAGS="-luuid $LDFLAGS" -j$NCORES
  if ( [ $LFSCTEST = 1 ] ) ; then
    make check
  fi
  if ( [ $? = 0 ] ) ; then
    su -c "make install-strip install-libs"
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
