#!/bin/bash
set -e
./configure.py --bootstrap
if ( [ $? = 0 ] ) ; then
  ./ninja all
  if ( [ $? = 0 ] ) ; then
    if ( [ $? = 0 ] ) ; then
      #.ninja install TODO
      find . -type f -executable -exec strip --strip-debug '{}' \;
      install -vm755 ninja /usr/bin/
      install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
      exit 0
    fi
  fi
fi
exit 1
