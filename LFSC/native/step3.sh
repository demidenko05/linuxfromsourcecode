#!/bin/bash
# in ~/LFSC/src with unpacked sources!:
set -e
mkdir -pv bgmp
cd bgmp
bash $LFSC_HOME/LFSC/native/gmp.sh
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bmpfr
  cd ../bmpfr
  bash $LFSC_HOME/LFSC/native/mpfr.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bmpc
  cd ../bmpc
  bash $LFSC_HOME/LFSC/native/mpc.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bisl
  cd ../bisl
  bash $LFSC_HOME/LFSC/native/isl.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../zlib-1.2.11
  bash $LFSC_HOME/LFSC/native/zlib.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bbinutils
  cd ../bbinutils
  bash $LFSC_HOME/LFSC/native/binutils.sh
fi
if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi
if ( [ $? = 0 ] ) ; then
  echo "Installing gmp-binutils OK, REBOOT!"
  exit 0
fi
echo "Something went wrong!"
exit 1
