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

# patch luci
patch -d feeds/luci -p1 -i ../../../patch/fullconenat-luci.patch