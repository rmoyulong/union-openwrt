#!/bin/bash

sudo curl -L -o rmoyulong.tar.gz https://github.com/rmoyulong/union-openwrt/releases/download/union_package/openwrt.tar.gz
tar zxvfp rmoyulong.tar.gz

# 取消主题默认设置
find package/luci-theme-*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;