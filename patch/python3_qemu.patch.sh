#公用函数
source $GITHUB_WORKSPACE/Scripts/functions.sh

cd openwrt
rm -rf feeds/packages/lang/python
merge_package master https://github.com/rmoyulong/old_coolsnowwolf_packages feeds/packages/lang lang/python

merge_package master https://github.com/coolsnowwolf/packages package utils/qemu
rm -rf feeds/packages/utils/qemu
cp -rf ./package/qemu feeds/packages/utils/