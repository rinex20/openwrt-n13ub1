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
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/tmp/luci-app-shadowsocks_1.3.6-1_all.ipk
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/tmp/luci-app-chinadns_1.6.0-1_all.ipk
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/tmp/ChinaDNS_1.3.2-4_ramips_24kec.ipk
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/tmp/luci-app-chinadns_1.6.0-1_all.ipk


cd /etc
mkdir dnsmasq.d
cd dnsmasq.d

wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/etc/dnsmasq.d/accelerated-domains.china.conf
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/etc/dnsmasq.d/bogus-nxdomains-china.conf
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/etc/dnsmasq.d/foreign_list.conf
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/etc/dnsmasq.d/google.china.conf


