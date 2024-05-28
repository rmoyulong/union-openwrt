#!/bin/bash
cd openwrt

#luci补丁
git config --global user.name "OpenWrt Builder"
git config --global user.email "buster-openwrt@ovvo.uk"
cp $GITHUB_WORKSPACE/patch/breeze303/0001-show-soc-status-on-luci.patch feeds/luci
cd feeds/luci
git am 0001-show-soc-status-on-luci.patch