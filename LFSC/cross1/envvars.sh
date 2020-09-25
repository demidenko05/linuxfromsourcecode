#!/bin/bash
#source ./envvars.sh printenv
if test "$(arch)" = "x86_64"; then
  export LFSC32B=0
else
  export LFSC32B=1
fi
#Bash hash function (see LFS/settingenvironment.html)?:
set +h
#new files writable only be owner:
umask 022
#see gcc/Environment-Variables.html ?locale -a
export LC_ALL=POSIX
#or grep -c processor /proc/cpuinfo - number of threads
export NCORES=$(nproc)
export LFSC_HOME=~
export LFSC=$LFSC_HOME/lfsc
export PATH=/bin:/usr/bin:/usr/local/bin
unset LDFLAGS
unset CXXFLAGS
unset CPPFLAGS
export LFSC_BUILD=$MACHTYPE
export LFSC_BUILD32=i686-pc-linux-gnu
export LFSC_BUILD64=x86_64-pc-linux-gnu
export LFSC_HOST32=i686-lfsc-linux-gnu
export LFSC_HOST64=x86_64-lfsc-linux-gnu
if ( [ $LFSC32B = 1 ] ) ; then
  #see kernel make file i386 or x86_64 for x86:
  export ARCH=i386
  export LFSC_HOST=i686-lfsc-linux-gnu
else 
  export ARCH=x86_64
  export LFSC_HOST=x86_64-lfsc-linux-gnu
fi
export CC="$LFSC_HOST-cc"
export GCC="$LFSC_HOST-gcc"
export CXX="$LFSC_HOST-g++"
export CPP="$LFSC_HOST-gcc -E"
export AR="$LFSC_HOST-ar"
export AS="$LFSC_HOST-as"
export NM="$LFSC_HOST-nm"
export LD="$LFSC_HOST-ld"
export RANLIB="$LFSC_HOST-ranlib"
export READELF="$LFSC_HOST-readelf"
export STRIP="$LFSC_HOST-strip"
export LDFLAGS="-L$LFSC/lib -L$LFSC/usr/lib"
export CFLAGS="-g -O2"
#TODO
export PKG_CONFIG_PATH=""
export PKG_CONFIG_LIBDIR="$LFSC/lib/pkgconfig:$LFSC/usr/lib/pkgconfig:$LFSC/usr/lib/x86_64-linux-gnu/pkgconfig"
export PKG_CONFIG_SYSROOT_DIR=$LFSC
