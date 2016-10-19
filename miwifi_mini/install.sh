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

