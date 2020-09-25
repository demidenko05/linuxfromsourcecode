#!/bin/bash
# in ..src with unpacked sources!:
set -e
cd linux-5.5.11
bash $LFSC_HOME/LFSC/cross1/kernelhead.sh
if ( [ $? = 0 ] ) ; then
  if ( [ $LFSC32B != 1 ] ) ; then
    mkdir -pv ../bglibc32
    cd ../bglibc32
    bash $LFSC_HOME/LFSC/cross1/glibc32.sh
    if ( [ $? = 0 ] ) ; then
      mkdir -pv ../bglibc64
      cd ../bglibc64
      bash $LFSC_HOME/LFSC/cross1/glibc64.sh
    fi
  else
    mkdir -pv ../bglibc64
    cd ../bglibc64
    bash $LFSC_HOME/LFSC/cross1/glibc64.sh
    if ( [ $? = 0 ] ) ; then
      mkdir -pv ../bglibc32
      cd ../bglibc32
      bash $LFSC_HOME/LFSC/cross1/glibc32.sh
    fi
  fi
fi
if ( [ $? = 0 ] ) ; then
  bash $LFSC_HOME/LFSC/cross1/localedef1.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../tzdb-2019c
  make TOPDIR=$LFSC install
fi
if ( [ $? = 0 ] ) ; then
  cd ../man-pages-5.05
  make DESTDIR=$LFSC install
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgmp
  cd ../bgmp
  bash $LFSC_HOME/LFSC/cross1/gmp.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bmpfr
  cd ../bmpfr
  bash $LFSC_HOME/LFSC/cross1/mpfr.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bmpc
  cd ../bmpc
  bash $LFSC_HOME/LFSC/cross1/mpc.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bisl
  cd ../bisl
  bash $LFSC_HOME/LFSC/cross1/isl.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../zlib-1.2.11
  bash $LFSC_HOME/LFSC/cross1/zlib.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bbinutils
  cd ../bbinutils
  bash $LFSC_HOME/LFSC/cross1/binutils.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgcc
  cd ../bgcc
  bash $LFSC_HOME/LFSC/cross1/gcc.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bcoreutils
  cd ../bcoreutils
  bash $LFSC_HOME/LFSC/cross1/coreutils.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../libcap-2.33
  bash $LFSC_HOME/LFSC/cross1/libcap.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bncursesw
  cd ../bncursesw
  bash $LFSC_HOME/LFSC/cross1/ncursesw.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../attr-2.4.48
  bash $LFSC_HOME/LFSC/cross1/attr.sh
fi
if ( [ $? = 0 ] ) ; then
  #d.run attr
  cd ../acl-2.2.53
  bash $LFSC_HOME/LFSC/cross1/acl.sh
fi
if ( [ $? = 0 ] ) ; then
  #without configure
  cd ../bzip2-1.0.8
  read -p " Comment in Makefile-libbz2_so these entries:
...
#CC=gcc
#AR=ar
#RANLIB=ranlib
#LDFLAGS=

BIGFILES=-D_FILE_OFFSET_BITS=64
...
Do you understand? " lfsctrash
  nano Makefile
  read -p " Comment in Makefile-libbz2_so CC entry:
...
SHELL=/bin/sh
#CC=gcc
BIGFILES=-D_FILE_OFFSET_BITS=64
...
Do you understand? " lfsctrash
  nano Makefile-libbz2_so
  bash $LFSC_HOME/LFSC/cross1/bzip2.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgzip
  cd ../bgzip
  bash $LFSC_HOME/LFSC/cross1/gzip.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bxzutils
  cd ../bxzutils
  bash $LFSC_HOME/LFSC/cross1/xzutils.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../btar
  cd ../btar
  bash $LFSC_HOME/LFSC/cross1/tar.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../butillinux
  cd ../butillinux
  bash $LFSC_HOME/LFSC/cross1/utillinux.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../be2fsprogs
  cd ../be2fsprogs
  bash $LFSC_HOME/LFSC/cross1/e2fsprogs.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bkbd
  cd ../bkbd
  bash $LFSC_HOME/LFSC/cross1/kbd.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bkmod
  cd ../bkmod
  bash $LFSC_HOME/LFSC/cross1/kmod.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bbison
  cd ../bbison
  bash $LFSC_HOME/LFSC/cross1/bison.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../breadline
  cd ../breadline
  bash $LFSC_HOME/LFSC/cross1/readline.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgdbm
  cd ../bgdbm
  bash $LFSC_HOME/LFSC/cross1/gdbm.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../blibpipeline
  cd ../blibpipeline
  bash $LFSC_HOME/LFSC/cross1/libpipeline.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../expat-2.2.9
  bash $LFSC_HOME/LFSC/cross1/expat.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bsed
  cd ../bsed
  bash $LFSC_HOME/LFSC/cross1/sed.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bm4
  cd ../bm4
  bash $LFSC_HOME/LFSC/cross1/m4.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgettext
  cd ../bgettext
  bash $LFSC_HOME/LFSC/cross1/gettext.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../gperf
  cd ../gperf
  bash $LFSC_HOME/LFSC/cross1/gperf.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgrep
  cd ../bgrep
  bash $LFSC_HOME/LFSC/cross1/grep.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bless
  cd ../bless
  bash $LFSC_HOME/LFSC/cross1/less.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgawk
  cd ../bgawk
  bash $LFSC_HOME/LFSC/cross1/gawk.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../btexinfo
  cd ../btexinfo
  bash $LFSC_HOME/LFSC/cross1/texinfo.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bmake
  cd ../bmake
  bash $LFSC_HOME/LFSC/cross1/make.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bpatch
  cd ../bpatch
  bash $LFSC_HOME/LFSC/cross1/patch.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../blibtool
  cd ../blibtool
  bash $LFSC_HOME/LFSC/cross1/libtool.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bautoconf
  cd ../bautoconf
  bash $LFSC_HOME/LFSC/cross1/autoconf.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bautomake
  cd ../bautomake
  bash $LFSC_HOME/LFSC/cross1/automake.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bdiffutils
  cd ../bdiffutils
  bash $LFSC_HOME/LFSC/cross1/diffutils.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bfindutils
  cd ../bfindutils
  bash $LFSC_HOME/LFSC/cross1/findutils.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bnano
  cd ../bnano
  bash $LFSC_HOME/LFSC/cross1/nano.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bbash
  cd ../bbash
  bash $LFSC_HOME/LFSC/cross1/bash.sh
fi
#text screenshot:
if ( [ $? = 0 ] ) ; then
  #without configure
  cd ../fbcat-0.5.1
  bash $LFSC_HOME/LFSC/cross1/fbcat.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../linux-5.5.11
  bash $LFSC_HOME/LFSC/cross1/kerninst.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ..
  bash $LFSC_HOME/LFSC/fls/all.sh
  echo "Installing OK"
  exit 0
fi
echo "Something went wrong!"
exit 1
