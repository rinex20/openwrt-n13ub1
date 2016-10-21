#!/bin/sh

clear
echo "#############################################################"
echo "#             Install Shadowsocks for Miwifi(    )          #"
echo "#############################################################"

opkg update

#Extra package
opkg install iptables-mod-nat-extra ip ipset libopenssl

#Extra package 2
opkg install kmod-nfnetlink kmod-ipt-ipset kmod-ipt-tproxy libmnl libpthread

#download shadowsocks-libev && chinadns
cd /tmp
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/tmp/shadowsocks-libev_2.5.5-1_ramips_24kec.ipk
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/tmp/luci-app-shadowsocks_1.3.6-1_all.ipk
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/tmp/luci-app-chinadns_1.6.0-1_all.ipk
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/tmp/ChinaDNS_1.3.2-4_ramips_24kec.ipk

opkg install shadowsocks-libev_2.5.5-1_ramips_24kec.ipk
opkg install ChinaDNS_1.3.2-4_ramips_24kec.ipk
opkg install luci-app-shadowsocks_1.3.6-1_all.ipk
opkg install luci-app-chinadns_1.6.0-1_all.ipk 

#mkdir dnsmasq for gfwlist domains
cd /etc
mkdir dnsmasq.d
cd dnsmasq.d

#download gfwlist domains
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/etc/dnsmasq.d/accelerated-domains.china.conf
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/etc/dnsmasq.d/bogus-nxdomains-china.conf
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/etc/dnsmasq.d/foreign_list.conf
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/etc/dnsmasq.d/google.china.conf

#download china_ip_list and save to /etc/chinadns_chnroute.txt
cd /etc
rm -f chinadns_chnroute.txt
wget -O- 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > /etc/chinadns_chnroute.txt

#add update scheduled task
cd /root
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/root/update_ignorelist
wget --no-check-certificate https://raw.githubusercontent.com/rinex20/openwrt-n13ub1/master/root/tester

chmod +x update_ignorelist
chmod +x tester

#add task into crontab
#4:30 on sunday
echo "30   4 * * * /root/update_ignorelist>/dev/null 2>&1" >> /etc/crontab

#every 10 minutes
echo "*/10 * * * * /root/tester >> /var/log/shadowsocks_watchdog.log 2>&1" >> /etc/crontab

#1:00 on sunday
echo "0    1 * * 7 echo \"\" /var/log/shadowsocks_watchdog.log" >> /etc/crontab

echo "Please check file /etc/crontab"

echo "Please check gfw domain file /etc/dnsmasq"

echo "Please check if setting 127.0.0.1 as dns service on wan interface or not"

echo "Please check if on port tunnel for 127.0.0.1#5300 for dns udp forward to 8.8.8.8:53 or not"

echo "And enjoy it!"

