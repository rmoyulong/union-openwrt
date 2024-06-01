#!/bin/bash

#公用函数
source $GITHUB_WORKSPACE/Scripts/functions.sh

echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >> feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >> feeds.conf.default
######################################################################################
git clone --depth=1 https://github.com/immortalwrt/homeproxy package/homeproxy
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-homeproxy
######################################################################################
#echo 'src-git helloworld https://github.com/fw876/helloworld' >> feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >> feeds.conf.default
#echo 'src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2' >> feeds.conf.default
#######################################################################################
#git_sparse_clone master https://github.com/fw876/helloworld helloworld
#git_sparse_clone main https://github.com/xiaorouji/openwrt-passwall openwrt-passwall
#git_sparse_clone main https://github.com/xiaorouji/openwrt-passwall2 openwrt-passwall2
git_sparse_clone master https://github.com/rmoyulong/AX6-Actions_Lede pcre
git_sparse_clone master https://github.com/rmoyulong/AX6-Actions_Lede aria2
git_sparse_clone master https://github.com/rmoyulong/AX6-Actions_Lede luci-app-overwall
git_sparse_clone master https://github.com/kiddin9/openwrt-packages dnsforwarder
git_sparse_clone master https://github.com/kiddin9/openwrt-packages mosdns
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-mosdns
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-turboacc
git_sparse_clone master https://github.com/kiddin9/openwrt-packages shadowsocksr-libev
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-ssr-plus
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-zerotier
####################################################################################
git_sparse_clone master https://github.com/kiddin9/openwrt-packages lua-maxminddb
git_sparse_clone master https://github.com/kiddin9/openwrt-packages vlmcsd
git_sparse_clone master https://github.com/kiddin9/openwrt-packages vsftpd-alt
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-vlmcsd
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-kodexplorer
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-usb-printer
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-vsftpd
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-ramfree

git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff
git clone --depth=1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata
git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter
git clone --depth=1 -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush package/luci-app-serverchan

# 在线用户
git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-onliner
sudo chmod -Rf 755 package/luci-app-onliner

# msd_lite
git clone --depth=1 https://github.com/ximiTech/luci-app-msd_lite package/luci-app-msd_lite
git clone --depth=1 https://github.com/ximiTech/msd_lite package/msd_lite

#theme
git_sparse_clone master https://github.com/rmoyulong/AX6-Actions_Lede luci-theme-openwrt-2020

# 取消主题默认设置
find package/luci-theme-*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;