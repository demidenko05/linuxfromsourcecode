#!/bin/bash
set -e
make
if ( [ $? = 0 ] ) ; then
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make PREFIX=/usr install; else su -c "make PREFIX=/usr install"; fi
  if ( [ $? = 0 ] ) ; then
    make clean 
    make -f Makefile-libbz2_so
    if ( [ $? = 0 ] ) ; then
      if test "$(id -u)" = "0"; then sh $LFSC_HOME/LFSC/native/bzip2-inst.sh; else su -c "sh $LFSC_HOME/LFSC/native/bzip2-inst.sh"; fi
      exit 0
    fi
  fi
fi
exit 1
