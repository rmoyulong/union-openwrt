#!/bin/bash

cd openwrt

git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/luci imm_luci
# patch luci
rm -rf feeds/luci/applications/luci-app-firewall
cp -rf ./imm_luci/applications/luci-app-firewall feeds/luci/applications/

rm -rf imm_luci