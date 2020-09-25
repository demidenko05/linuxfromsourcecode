#!/bin/bash
set -e
# --build=$LFSC_BUILD --host=$LFSC_HOST
../coreutils-8.31/configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix= --includedir=/usr/include --datarootdir=/usr/share --libexecdir=/usr/libexec \
--enable-install-program=arch,coreutils,hostname --with-gnu-ld
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      ln -svf ../../bin/arch $LFSC/usr/bin/arch
      #GTK glib hardcoded TODO? all to /usr/bin?
      ln -svf ../../bin/env $LFSC/usr/bin/env
      exit 0
    fi
  fi
fi
exit 1
