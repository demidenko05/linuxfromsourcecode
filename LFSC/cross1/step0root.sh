#!/bin/bash
set -e
update-alternatives --install /usr/bin/c++ c++ /usr/bin/x86_64-linux-gnu-g++-9 1
update-alternatives --set c++ /usr/bin/x86_64-linux-gnu-g++-9
update-alternatives --install /usr/bin/cc cc /usr/bin/x86_64-linux-gnu-gcc-9 1
update-alternatives --set cc /usr/bin/x86_64-linux-gnu-gcc-9
update-alternatives --install /lib/cpp cpp /usr/bin/x86_64-linux-gnu-cpp-9 1
update-alternatives --set cpp /usr/bin/x86_64-linux-gnu-cpp-9
ln -vsf /usr/bin/x86_64-linux-gnu-g++-9 /usr/bin/g++
ln -vsf /usr/bin/x86_64-linux-gnu-gcc-9 /usr/bin/gcc
if ( [ $? = 0 ] ) ; then
  exit 0
fi
exit 1
