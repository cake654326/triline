#!/bin/sh

# 尝试修正一些比较shit的DE进程引起的系统不适问题。
# 包括gnome的几个程序，以及kde的akonadictl等几个程序

if [ -f /usr/bin/akonadictl ]; then
    mv -v /usr/bin/akonadictl /usr/bin/akonadictl.bak
fi

# TODO
# /usr/lib/gvfs/gvfsd
# /usr/lib/gvfs/gvfsd-fuse

# 在使用netctl的时候, 和NetworkManager冲突
# mv -v /usr/bin/NetworkManager{,.bak}

# systemctl stop mandb
# systemctl disable mandb
# systemctl stop updatedb.timer
# systemctl disable updatedb.timer
# systemctl stop updatedb
# systemctl disable updatedb

