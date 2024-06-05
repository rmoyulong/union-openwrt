rm -rf feeds/packages/net/homeproxy
rm -rf feeds/luci/applications/luci-app-homeproxy
rm -rf feeds/kenzo/homeproxy
rm -rf feeds/kenzo/luci-app-homeproxy
rm -rf feeds/luci/applications/luci-app-turboacc
rm -rf feeds/luci/applications/luci-app-mosdns
###############################
rm -rf  package/openwrt-passwall/shadowsocks-rust
####################################################
#解决shadowsocks-libev编译错误
rm -rf feeds/packages/net/shadowsocks-libev
cp -rf ./packages/shadowsocks-libev feeds/packages/net/
#####################################################