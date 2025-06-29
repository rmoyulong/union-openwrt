#公用函数
source $GITHUB_WORKSPACE/Scripts/functions.sh

cd openwrt
merge_package master https://github.com/coolsnowwolf/packages package lang/python3
rm -rf feeds/packages/lang/python3
cp -rf ./package/python3 feeds/packages/lang/