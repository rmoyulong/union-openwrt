#公用函数
source $GITHUB_WORKSPACE/Scripts/functions.sh
		
#如果使用自定义的nss wifi插件就要删除lede自带的qca
cd openwrt
rm -rf ./package/qca

#添加nss 附加依赖
git_sparse_clone master https://github.com/rmoyulong/AX6-Actions_Lede qca-nss-dp
git_sparse_clone master https://github.com/rmoyulong/AX6-Actions_Lede qca-ssdk

#增加turboacc
echo -e 'luci-app-turboacc=y' >> .config