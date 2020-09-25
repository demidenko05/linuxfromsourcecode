#!/bin/bash
set -e
install -vm755 libbz2.so.1.0.8 /usr/lib
ln -svf libbz2.so.1.0.8 /usr/lib/libbz2.so.1.0
ln -svf libbz2.so.1.0 /usr/lib/libbz2.so
ldconfig
exit 0
