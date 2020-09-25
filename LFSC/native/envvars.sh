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
unset LDFLAGS
unset CXXFLAGS
unset CPPFLAGS
export LFSC_HOME=~
if ( [ $LFSC32B = 1 ] ) ; then
  #see kernel make file i386 or x86_64 for x86:
  export ARCH=i386
else 
  export ARCH=x86_64
fi
export CFLAGS="-g -O2"
#because all new Linux's ld make new tags by default!
export LDFLAGS="-Wl,--enable-new-dtags"
export LFSCTEST=1
