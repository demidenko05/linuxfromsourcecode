#!/bin/bash
set -e
install -v -d -m755 /usr/share/fonts/dejavu &&
install -v -m644 ttf/*.ttf /usr/share/fonts/dejavu &&
fc-cache -v /usr/share/fonts/dejavu
if ( [ $? = 0 ] ) ; then
 exit 0
fi
exit 1
