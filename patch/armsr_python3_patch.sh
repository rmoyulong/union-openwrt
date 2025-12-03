#公用函数
source $GITHUB_WORKSPACE/Scripts/functions.sh

cd openwrt
rm -rf feeds/packages/lang/python

merge_package master https://github.com/rmoyulong/old_coolsnowwolf_packages feeds/packages/lang lang/python

rm -rf target/linux/armsr
tar -xzvf $GITHUB_WORKSPACE/patch/armsr.tar.gz
#chmod -Rf 755 target/linux/armsr