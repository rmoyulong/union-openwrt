#公用函数
source $GITHUB_WORKSPACE/Scripts/functions.sh
		
#如果使用自定义的nss wifi插件就要删除lede自带的qca
cd openwrt
rm -rf ./package/qca

#添加nss 附加依赖
# AgustinLorenzo/openwrt 自带qca-nss-dp
git_sparse_clone master https://github.com/rmoyulong/AX6-Actions_Lede qca-nss-dp

#用lede替换AgustinLorenzo/nss-packages相同的插件package/qca/qca-nss-ecm(去掉) package/qca/qca-ssdk
rm -rf feeds/nss_packages/qca-nss-ecm
rm -rf feeds/nss_packages/qca-ssdk
git_sparse_clone master https://github.com/rmoyulong/AX6-Actions_Lede qca


#增加turboacc
echo -e 'luci-app-turboacc=y' >> .config