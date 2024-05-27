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

git clone -b master --depth 1 --single-branch https://github.com/immortalwrt/luci imm_luci
# patch luci
rm -rf feeds/luci/applications/luci-app-firewall
cp -rf ./imm_luci/luci/applications/luci-app-firewall feeds/luci/applications/

rm -rf imm_luci