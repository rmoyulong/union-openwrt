#如果使用自定义的nss wifi插件就要删除lede自带的qca
cd openwrt
rm -rf ./package/qca


#增加turboacc
echo -e 'luci-app-turboacc=y' >> .config