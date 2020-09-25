#!/bin/bash
set -e
#CFLAGS="-g -O2 -W -Wno-unused-result -fPIC -Wall"
PREFIX=/usr
LIBMAJOR=2
LIBMINOR=1
LIBPOINT=0
LIBVER=$LIBMAJOR.$LIBMINOR.$LIBPOINT
install -d $PREFIX/bin
install -vs pbmtools/pbmtojbg $PREFIX/bin
install -vs pbmtools/jbgtopbm $PREFIX/bin
install -vs pbmtools/pbmtojbg85 $PREFIX/bin
#rm -v libjbig/*.o
#gcc -c $CFLAGS -I.libjbig/jbig.h -I.libjbig/jbig_ar.h libjbig/jbig.c -o libjbig/jbig.o
#gcc -c $CFLAGS -I.libjbig/jbig85.h -I.libjbig/jbig_ar.h libjbig/jbig85.c -o libjbig/jbig85.o
#gcc -c $CFLAGS -I.libjbig/jbig_ar.h libjbig/jbig_ar.c -o libjbig/jbig_ar.o
install -d $PREFIX/lib
LIBNM=jbig
gcc -shared $LDFLAGS -Wl,-soname -Wl,lib$LIBNM.so.$LIBMAJOR -o libjbig/lib$LIBNM.so libjbig/$LIBNM.o libjbig/jbig_ar.o
install -vsm755 libjbig/lib$LIBNM.so $PREFIX/lib/lib$LIBNM.so.$LIBVER
ln -sf lib$LIBNM.so.$LIBVER $PREFIX/lib/lib$LIBNM.so.$LIBMAJOR
ln -sf lib$LIBNM.so.$LIBMAJOR $PREFIX/lib/lib$LIBNM.so
LIBNM=jbig85
gcc -shared $LDFLAGS -Wl,-soname -Wl,lib$LIBNM.so.$LIBMAJOR -o libjbig/lib$LIBNM.so libjbig/$LIBNM.o libjbig/jbig_ar.o
install -vsm755 libjbig/lib$LIBNM.so $PREFIX/lib/lib$LIBNM.so.$LIBVER
ln -sf lib$LIBNM.so.$LIBVER $PREFIX/lib/lib$LIBNM.so.$LIBMAJOR
ln -sf lib$LIBNM.so.$LIBMAJOR $PREFIX/lib/lib$LIBNM.so
install -d $PREFIX/include
install -vm644 libjbig/*.h $PREFIX/include
install -d $PREFIX/man/man1
install -vm644 pbmtools/*.1 $PREFIX/man/man1
install -d $PREFIX/man/man5
install -vm644 pbmtools/*.5 $PREFIX/man/man5
if ( [ $? = 0 ] ) ; then
  exit 0
fi
exit 1
