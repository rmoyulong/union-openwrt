#!/bin/bash

cd openwrt

git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/immortalwrt immortalwrt
# fullconenat-nft
cp -rf ./immortalwrt/package/network/utils/fullconenat-nft package/network/utils/

# libnftnl
rm -rf ./package/libs/libnftnl
cp -rf ./immortalwrt/package/libs/libnftnl package/libs/

# nftables
rm -rf ./package/network/utils/nftables/
cp -rf ./immortalwrt/package/network/utils/nftables package/network/utils/

# firewall
rm -rf ./package/network/config/firewall
cp -rf ./immortalwrt/package/network/config/firewall package/network/config/
cp -rf $1/patch/nftables_Makefile package/network/config/firewall/Makefile

# firewall4
rm -rf ./package/network/config/firewall4
cp -rf ./immortalwrt/package/network/config/firewall4 package/network/config/
cp -rf $1/patch/nftables4_Makefile package/network/config/firewall/Makefile

rm -rf immortalwrt