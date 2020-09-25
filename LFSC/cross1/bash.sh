#!/bin/bash
set -e
#cross-compiling with "--build=$LFSC_BUILD --host=$LFSC_HOST" makes bash unable to run expressions in-parentheses in Makefile like : "($(am__cd) $$subdir && $(MAKE) $(AM_MAKEFLAGS) $$local_target)"
../bash-5.0/configure --disable-static --prefix= --includedir=/usr/include --datarootdir=/usr/share \
--libexecdir=/usr/libexec --with-gnu-ld --without-bash-malloc --enable-multibyte
#5.0 check crosscomp linc to ltinfo5!
# --with-installed-readline
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      ln -sfv bash $LFSC/bin/sh
      exit 0
    fi
  fi
fi
exit 1
