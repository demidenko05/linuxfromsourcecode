#!/bin/bash
set -e
#it always install into /lib and /usr/lib, according to HFS lib must have binaries of base architecture, but it can have link lib32/64
cat > configparms << "EOF"
slibdir=/lib32
libdir=/usr/lib32
EOF
if ( [ $LFSC32B != 1 ] ) ; then
  ../glibc-2.31/configure CC="$LFSC_HOST-cc -m32" CXX="$LFSC_HOST-g++ -m32" --prefix=/usr --build=$LFSC_BUILD \
  --host=$LFSC_HOST32 --enable-kernel=5.5.0 --includedir="/usr/include/i386-linux-gnu" --with-headers=$LFSC/usr/include \
  --disable-profile --with-gnu-ld --with-sysroot=$LFSC --enable-pc-files --enable-stack-protector=strong
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
      exit 0
    fi
  fi
fi
exit 1
