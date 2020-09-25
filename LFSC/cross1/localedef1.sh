#!/bin/bash
#Debian has C file! for tests?
#localedef -c -f UTF-8 -i C $LFSC/usr/lib/locale/C.UTF-8
#LFS method:
#localedef -c -f UTF-8 -i POSIX $LFSC/usr/lib/locale/C.UTF-8
localedef -c -i ja_JP -f SHIFT_JIS $LFSC/usr/lib/locale/ja_JP.SIJS
set -e
localedef -f UTF-8 -i ru_RU $LFSC/usr/lib/locale/ru_RU.UTF-8
localedef -f UTF-8 -i en_US $LFSC/usr/lib/locale/en_US.UTF-8
#for farther tests during native installation:
localedef -i cs_CZ -f UTF-8 $LFSC/usr/lib/locale/cs_CZ.UTF-8
localedef -i de_DE -f ISO-8859-1 $LFSC/usr/lib/locale/de_DE
localedef -i de_DE@euro -f ISO-8859-15 $LFSC/usr/lib/locale/de_DE@euro
localedef -i en_HK -f ISO-8859-1 $LFSC/usr/lib/locale/en_HK
localedef -i en_PH -f ISO-8859-1 $LFSC/usr/lib/locale/en_PH
localedef -i en_US -f ISO-8859-1 $LFSC/usr/lib/locale/en_US
localedef -i es_MX -f ISO-8859-1 $LFSC/usr/lib/locale/es_MX
localedef -i fa_IR -f UTF-8 $LFSC/usr/lib/locale/fa_IR
localedef -i fr_FR -f ISO-8859-1 $LFSC/usr/lib/locale/fr_FR
localedef -i fr_FR@euro -f ISO-8859-15 $LFSC/usr/lib/locale/fr_FR@euro
localedef -i it_IT -f ISO-8859-1 $LFSC/usr/lib/locale/it_IT
localedef -i ja_JP -f EUC-JP $LFSC/usr/lib/locale/ja_JP
#glibc2.30:
localedef -i de_DE -f UTF-8 $LFSC/usr/lib/locale/de_DE.UTF-8
localedef -i el_GR -f ISO-8859-7 $LFSC/usr/lib/locale/el_GR
localedef -i en_GB -f UTF-8 $LFSC/usr/lib/locale/en_GB.UTF-8
localedef -i fr_FR -f UTF-8 $LFSC/usr/lib/locale/fr_FR.UTF-8
localedef -i it_IT -f UTF-8 $LFSC/usr/lib/locale/it_IT.UTF-8
localedef -i ja_JP -f UTF-8 $LFSC/usr/lib/locale/ja_JP.UTF-8
localedef -i ru_RU -f KOI8-R $LFSC/usr/lib/locale/ru_RU.KOI8-R
localedef -i tr_TR -f UTF-8 $LFSC/usr/lib/locale/tr_TR.UTF-8
localedef -i zh_CN -f GB18030 $LFSC/usr/lib/locale/zh_CN.GB18030
localedef -i zh_HK -f BIG5-HKSCS $LFSC/usr/lib/locale/zh_HK.BIG5-HKSCS
