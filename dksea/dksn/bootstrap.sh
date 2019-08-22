#!/bin/sh

#set -x
#set -e

env > env.txt
env
cat /etc/resolv.conf

#########
cp /etc/hosts{,.bak}
echo "101.6.8.193 mirrors.tuna.tsinghua.edu.cn" >> /etc/hosts
echo "202.141.176.110 mirrors.ustc.edu.cn" >> /etc/hosts
echo "59.111.0.251 mirrors.163.com" >> /etc/hosts

pacman -Sy
pacman -S --noconfirm openssh nginx iproute2 privoxy #supervisor
pacman -S --noconfirm tmux # some tools
pacman -S --noconfirm opendht
rddpkgs="libpcap iptables libnetfilter_conntrack libnfnetlink systemd dbus"
for p in $rddpkgs; do
    pacman -Rdd --noconfirm $p
done
r1pkgs=" icu libxml2 libcroco gettext"
for p in $r1pkgs; do
    pacman -R --noconfirm $p
done

rm -f /var/cache/pacman/pkg/*
rm -rf /usr/share/{man,doc,info,i18n,zoneinfo}/*
/usr/bin/deepclean.sh

/usr/bin/ssh-keygen -A
chmod +x /entrypoint.sh
mv /sshd_config /etc/ssh/
mv /etc/hosts{.bak,}

mkdir -p /etc/nginx/conf
mv /nginx.conf /etc/nginx/
mv /upnginx.conf /etc/nginx/conf/
