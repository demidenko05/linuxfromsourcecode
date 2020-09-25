#!/bin/bash
set -e
../less-530/configure --disable-static --prefix=/usr --build=$LFSC_BUILD --host=$LFSC_HOST --with-editor=nano
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    if ( [ $? = 0 ] ) ; then
      make DESTDIR=$LFSC install-strip
      if ( [ $? = 0 ] ) ; then
        ln -sfv less $LFSC/usr/bin/pager
        ln -sfv ../usr/bin/less $LFSC/bin/less
        exit 0
      fi
    fi
  fi
fi
exit 1
