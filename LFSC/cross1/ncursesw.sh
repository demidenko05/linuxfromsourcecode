#!/bin/bash
set -e
# ?TODO outdated gcc/Preprocessor-Options -P to fix error "expected ) before int" in macro-def in curses.h
../ncurses-6.2/configure CPPFLAGS="-P $CPPFLAGS" --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr --with-shared \
--with-termlib --with-sysroot=$LFSC --with-gnu-ld --enable-widec --enable-pc-files --with-pkg-config-libdir=/usr/lib/pkgconfig
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    find . -type f -executable -exec strip --strip-debug '{}' \;
    export LD_LIBRARY_PATH="/$LFSC/usr/lib"
    make TIC_PATH="../progs/tic" DESTDIR=$LFSC install
    unset LD_LIBRARY_PATH
    if ( [ $? = 0 ] ) ; then
      #But the libtinfow interface is upward compatible from libtinfo, so it would be possible to overlay
      #libtinfo.so with a "wide" version of libtinfow.so by renaming it with this option.
      #This is for bash, less, gawk!!!! otherwise LD links them to Debian tiofo.5??? TODO
      cd $LFSC/usr/lib
      ln -sfv libtinfow.a libtinfo.a
      ln -sfv libtinfow_g.a libtinfo_g.a
      ln -sfv libtinfow.so.6.2 libtinfo.so.6
      ln -sfv libtinfo.so.6 libtinfo.so
      #procps requires ncurses, but ncuresesw will do, its configure has hardcoded pkg-config ncurses, so make fake ncurses.pc:
      cp -v $LFSC/usr/lib/pkgconfig/ncursesw.pc $LFSC/usr/lib/pkgconfig/ncurses.pc
      exit 0
    fi
  fi
fi
exit 1
