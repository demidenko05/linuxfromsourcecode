#!/bin/bash
set -e
#it always install into /lib64 and /usr/lib64
if ( [ $LFSC32B = 1 ] ) ; then
  ../glibc-2.31/configure CC="$LFSC_HOST-cc -m64" CXX="$LFSC_HOST-g++ -m64" --build=$LFSC_BUILD --host=$LFSC_HOST64 \
  --prefix=/usr --includedir="/usr/include/x86_64-linux-gnu" --enable-kernel=5.5.0 --with-headers=$LFSC/usr/include \
  --disable-profile --with-gnu-ld --enable-pc-files --with-sysroot=$LFSC --enable-stack-protector=strong --with-sysroot=$LFSC
else
  ../glibc-2.31/configure --prefix=/usr --build=$LFSC_BUILD --host=$LFSC_HOST --enable-kernel=5.5.0 \
  --with-headers=$LFSC/usr/include --disable-profile --with-gnu-ld --with-sysroot=$LFSC --enable-pc-files \
  --enable-stack-protector=strong
fi
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    find . -type f -executable -exec strip --strip-debug '{}' \;
    make DESTDIR=$LFSC install
    if ( [ $? = 0 ] ) ; then
      if ( [ $LFSC32B = 1 ] ) ; then
        mkdir -pv $LFSC/usr/include/gnu
        cd $LFSC/usr/include/gnu
        ln -sfv ../x86_64-linux-gnu/gnu/lib-names-64.h lib-names-64.h
        ln -sfv ../x86_64-linux-gnu/gnu/stubs-64.h stubs-64.h
      fi
      exit 0
    fi
  fi
fi
exit 1
