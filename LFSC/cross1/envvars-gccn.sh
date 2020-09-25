#!/bin/bash
#for native gcc9.3.0
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
export PATH=/bin:/usr/bin
unset LDFLAGS
unset CXXFLAGS
unset CPPFLAGS
