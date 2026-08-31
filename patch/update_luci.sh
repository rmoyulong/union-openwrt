#!/bin/bash

sudo mv /usr/local/bin/runc /usr/local/bin/runc.bak

cd openwrt
./scripts/feeds update -a
./scripts/feeds install -a

git clone --single-branch --branch master https://github.com/immortalwrt/packages packages_temp

#rm -rf feeds/packages/utils/dockerd/*
#rm -rf feeds/packages/utils/containerd/*

#cp -rf ./packages_temp/utils/dockerd/* feeds/packages/utils/dockerd/
#cp -rf ./packages_temp/utils/containerd/* feeds/packages/utils/containerd/

rm -rf feeds/packages/utils/*
cp -rf ./packages_temp/utils/* feeds/packages/utils/

# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch