#如果使用自定义的nss wifi插件就要删除lede自带的qca
rm -rf openwrt/package/qca/shortcut-fe

# 调整内核版本为 5.15
sed -i 's/KERNEL_PATCHVER:=.*/KERNEL_PATCHVER:=5.15/' openwrt/target/linux/amlogic/Makefile
			