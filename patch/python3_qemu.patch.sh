#公用函数
source $GITHUB_WORKSPACE/Scripts/functions.sh

cd openwrt
merge_package master https://github.com/coolsnowwolf/packages package lang/python
rm -rf feeds/packages/lang/python
cp -rf ./package/python feeds/packages/lang/

merge_package master https://github.com/coolsnowwolf/packages package utils/qemu
rm -rf feeds/packages/utils/qemu
cp -rf ./package/qemu feeds/packages/utils/