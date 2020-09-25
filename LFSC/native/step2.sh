#!/bin/bash
set -e
if ( [ $LFSC32B != 1 ] ) ; then
  mkdir -pv bglibc32
  cd bglibc32
  bash $LFSC_HOME/LFSC/native/glibc32.sh
  if ( [ $? = 0 ] ) ; then
    mkdir -pv ../bglibc64
    cd ../bglibc64
    bash $LFSC_HOME/LFSC/native/glibc64.sh
  fi
else
  mkdir -pv bglibc64
  cd bglibc64
  bash $LFSC_HOME/LFSC/native/glibc64.sh
  if ( [ $? = 0 ] ) ; then
    mkdir -pv ../bglibc32
    cd ../bglibc32
    bash $LFSC_HOME/LFSC/native/glibc32.sh
  fi
fi
if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi
if ( [ $? = 0 ] ) ; then
  echo "Installing GLIBC32/64 OK. REBOOT!"
  exit 0
fi
echo "Something went wrong!"
exit 1
