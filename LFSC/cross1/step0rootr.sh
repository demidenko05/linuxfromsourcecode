#!/bin/bash
set -e
update-alternatives --set c++ /usr/bin/g++
update-alternatives --set cc /usr/bin/gcc
update-alternatives --set cpp /usr/bin/x86_64-linux-gnu-cpp-6
ln -vsf /usr/bin/x86_64-linux-gnu-g++-6 /usr/bin/g++
ln -vsf /usr/bin/x86_64-linux-gnu-gcc-6 /usr/bin/gcc
if ( [ $? = 0 ] ) ; then
  exit 0
fi
exit 1
