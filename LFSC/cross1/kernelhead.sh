#!/bin/bash
set -e
make mrproper
make headers_check
make INSTALL_HDR_PATH=dest headers_install
cp -rv dest/include/* $LFSC/usr/include
