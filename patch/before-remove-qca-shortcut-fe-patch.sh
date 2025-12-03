#公用函数
source $GITHUB_WORKSPACE/Scripts/functions.sh

#如果使用自定义的nss wifi插件就要删除lede自带的qca
rm -rf openwrt/package/qca/shortcut-fe


cd openwrt
rm -rf target/linux/amlogic
tar -xzvf $GITHUB_WORKSPACE/patch/amlogic.tar.gz
chmod -Rf 755 target/linux/amlogic

# 调整内核版本为 5.15
sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=5.15/' target/linux/amlogic/Makefile
			
rm -rf feeds/packages/lang/python
merge_package master https://github.com/rmoyulong/old_coolsnowwolf_packages feeds/packages/lang lang/python