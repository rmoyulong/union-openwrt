#!/bin/bash

cd openwrt
./scripts/feeds update -a

rm -rf package/feeds/packages/containerd/*
rm -rf feeds/packages/utils/containerd/*

cp -rf $GITHUB_WORKSPACE/patch/containerd/* package/feeds/packages/containerd/
cp -rf $GITHUB_WORKSPACE/patch/containerd/* feeds/packages/utils/containerd/

# Adjust source code
patch -p1 -f < $(dirname "$0")/luci.patch



