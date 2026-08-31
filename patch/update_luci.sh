#!/bin/bash

cd openwrt
./scripts/feeds update -a

git clone --depth=1 https://github.com/immortalwrt/packages packages_temp

rm -rf feeds/packages/utils/dockerd/*
rm -rf feeds/packages/utils/containerd/*

cp -rf ./packages_temp/utils/dockerd/* feeds/packages/utils/dockerd/
cp -rf ./packages_temp/utils/containerd/* feeds/packages/utils/containerd/

# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch