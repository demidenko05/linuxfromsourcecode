#!/bin/bash
set -e
../mpfr-4.0.2/configure --disable-static --prefix=/usr --with-gnu-ld
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make html
    if ( [ $? = 0 ] ) ; then
      #readelf -d tversion | grep RPATH(RUNPATH) shows /usr/lib before ../src/.libs!
#+++this is because of existing /usr/lib64/libquadmath.la!!!!
# !!!! moving all *la from /usr/lib64 resolves the problem!!!
      #only this too rude method at this time:
      mkdir -pv laarch
      su -c "mv /usr/lib64/*.la laarch"
      if ( [ $LFSCTEST = 1 ] ) ; then
        make check
      fi
      su -c "mv laarch/* /usr/lib64"
      if ( [ $? = 0 ] ) ; then
        su -c "make install-strip install-html"
        if ( [ $? = 0 ] ) ; then
          exit 0
        fi
      fi
    fi
  fi
fi
exit 1
