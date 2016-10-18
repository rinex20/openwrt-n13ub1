# openwrt-n13ub1


https://dl.bintray.com/aa65535/opkg/shadowsocks-libev/2.5.3/ramips/

采用ss+gfwlist方式freeinternet

注意几点：
1.安装ss后，设置为透明代理
2.access control这部分设置为过滤china ip，一般共用chiandns的chnroute，需要经常更新，采用以下语句：
wget -O- 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | \
    awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > \
    /etc/chnroute.txt

3.设置本地解析的地址为普通dns，做好是当地ISP的dns

4.注意取消“忽略解析文件”的勾选

5.设置dnsmasq的conf文件，增加一个dnsmasq.d的目录，把加速的和特别的域名解析，指定特别的解析地址
可参考这个文件  https://github.com/cokebar/gfwlist2dnsmasq

6.使用计划任务自动更新CHNROUTE（IGNORE.LIST）文件
新建一个文件 /root/update_ignore_list 写入如下内容


#!/bin/sh
set -e -o pipefail

wget -O- 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | \
    awk -F\| '/CN\|ipv4/ { printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > \
    /tmp/ignore.list

mv /tmp/ignore.list /etc/

if pidof ss-redir>/dev/null; then
    /etc/init.d/shadowsocks restart
fi

使用 chmod +x /root/update_ignore_list 添加可执行权限；
增加计划执行：
30    4     *     *     *     /root/update_ignore_list>/dev/null 2>&1




