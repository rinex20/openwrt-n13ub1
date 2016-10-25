中科大源
src/gz chaos_calmer_base http://openwrt.proxy.ustclug.org/chaos_calmer/15.05.1/ramips/mt7620/packages/base
src/gz chaos_calmer_luci http://openwrt.proxy.ustclug.org/chaos_calmer/15.05.1/ramips/mt7620/packages/luci
src/gz chaos_calmer_packages http://openwrt.proxy.ustclug.org/chaos_calmer/15.05.1/ramips/mt7620/packages/packages
src/gz chaos_calmer_routing http://openwrt.proxy.ustclug.org/chaos_calmer/15.05.1/ramips/mt7620/packages/routing
src/gz chaos_calmer_telephony http://openwrt.proxy.ustclug.org/chaos_calmer/15.05.1/ramips/mt7620/packages/telephony
src/gz chaos_calmer_management http://openwrt.proxy.ustclug.org/chaos_calmer/15.05.1/ramips/mt7620/packages/management



backup
------------------------------------------------------
dest root /
dest ram /tmp
lists_dir ext /var/opkg-lists
option overlay_root /overlay
option check_signature 1
------------------------------------------------------


------------------------------------------------------
src/gz chaos_calmer_base http://downloads.openwrt.org/chaos_calmer/15.05.1/ramips/mt7620/packages/base
src/gz chaos_calmer_luci http://downloads.openwrt.org/chaos_calmer/15.05.1/ramips/mt7620/packages/luci
src/gz chaos_calmer_packages http://downloads.openwrt.org/chaos_calmer/15.05.1/ramips/mt7620/packages/packages
src/gz chaos_calmer_routing http://downloads.openwrt.org/chaos_calmer/15.05.1/ramips/mt7620/packages/routing
src/gz chaos_calmer_telephony http://downloads.openwrt.org/chaos_calmer/15.05.1/ramips/mt7620/packages/telephony
src/gz chaos_calmer_management http://downloads.openwrt.org/chaos_calmer/15.05.1/ramips/mt7620/packages/management
------------------------------------------------------
