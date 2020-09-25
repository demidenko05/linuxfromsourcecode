#!/bin/bash
set -e
#LFS method for fixing last m4 for glibc2.31:
cd m4-1.4.18
sed -i 's/IO_ftrylockfile/IO_EOF_SEEN/' lib/*.c
echo "#define _IO_IN_BACKUP 0x100" >> lib/stdio-impl.h
if ( [ $? = 0 ] ) ; then
  exit 0
fi
exit 1
