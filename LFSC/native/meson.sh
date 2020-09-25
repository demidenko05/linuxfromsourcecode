#!/bin/bash
set -e
python3 setup.py build
if ( [ $? = 0 ] ) ; then
  python3 setup.py install --root=/
  exit 0
fi
exit 1
