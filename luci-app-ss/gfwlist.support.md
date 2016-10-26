原理

此功能是访问控制功能的扩展应用, 在 ipset ss_spec_dst_bp 中设置 0.0.0.0/1 和 128.0.0.0/1 后, 所有 IP 都不使用 SS 代理了, 而 ipset ss_spec_dst_fw 中的 IP 是会被强制使用 SS 代理的, 且 ss_spec_dst_fw 的优先级要高于 ss_spec_dst_bp, 所有可以达到使用 GfwList 的目的.


进入 Luci 界面 -> 访问控制 -> 外网区域
「被忽略IP列表」 选择留空(/dev/null)
「额外被忽略IP」 设置为 0.0.0.0/1 和 128.0.0.0/1


对于 GfwList 中的 IP 地址, 可以直接添加到「强制走代理IP」里
也可以直接编辑 /etc/config/shadowsocks 文件，在 access_control节下面添加类似如下内容

list wan_fw_ips '123.123.123.123'

对于 GfwList 中的域名, 新建一个 dnsmasq 的配置文件, 里面写入类似如下的内容

# 使用不受污染干扰的 DNS 解析该域名
server=/google.com/127.0.0.1#5353
# 将解析出来的结果保存到名为 ss_spec_dst_fw 的 ipset 表中
ipset=/google.com/ss_spec_dst_fw

每次重启 shadowsocks 后 ss_spec_dst_fw 都会被销毁重建, 所以您需要在每次重启 shadowsocks 后重启 Dnsmasq 以及将下游设备的 DNS 缓存清空, 使 Dnsmasq 可以重新将查询结果保存到 ss_spec_dst_fw 中.
