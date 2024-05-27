#!/bin/bash

cd openwrt

function git_sparse_clone_base() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../
  cd .. && rm -rf $repodir
}

# fullconenat-nft
git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/immortalwrt immortalwrt

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
# firewall4
rm -rf ./package/network/config/firewall4
cp -rf ./immortalwrt/package/network/config/firewall4 package/network/config/
