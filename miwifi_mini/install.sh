#!/bin/sh

clear
echo "#############################################################"
echo "#             Install Shadowsocks for Miwifi(    )          #"
echo "#############################################################"

opkg update

#Extra package
opkg install iptables-mod-nat-extra ipset libopenssl

#Extra package 2
opkg install kmod-nfnetlink kmod-ipt-ipset kmod-ipt-tproxy libmnl libpthread

#download shadowsocks-libev
cd /tmp
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/tmp/shadowsocks-libev_2.5.5-1_ramips_24kec.ipk

wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/tmp/

