#!/bin/bash
set -e
mkdir -pv buildlfsc
cd buildlfsc
#extremely large 20GB build + 20GB install!!!!!!!!!! WITHOUT UNINSTALL!!!!
#cmake -DCMAKE_INSTALL_PREFIX=/usr
#cmake --build .
#su root -c "cmake --build . --target install"
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DLLVM_ENABLE_FFI=ON \
-DCMAKE_BUILD_TYPE=Release -DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_LINK_LLVM_DYLIB=ON -DLLVM_ENABLE_RTTI=ON  \
-DLLVM_BUILD_TESTS=ON -Wno-dev -G Ninja ..
#-DLLVM_TARGETS_TO_BUILD="host;AMDGPU;BPF" 
if ( [ $? = 0 ] ) ; then
  ninja
  if ( [ $? = 0 ] ) ; then
    find . -type f -executable -exec strip --strip-debug '{}' \;
    if test "$(id -u)" = "0"; then ninja install; else su -c "ninja install"; fi
   exit 0
  fi
fi
exit 1
