dos2unix $1/$2/etc/*.sh
dos2unix $1/$2/etc/rc.*
chmod -Rf 755 $1/$2/etc/*.sh
chmod -Rf 755 $1/$2/etc/rc.*
chmod -Rf 755 $1/$2/etc/init.d/*
          
#aria2
chmod -R 777 $1/$2/etc/aria2
chmod -R 777 $1/$2/mnt/sda1/aria2
chmod -R 777 $1/$2/mnt/sda1/aria2/download
chmod -R 755 $1/$2/mnt/sda1/share
		  
sed -i 's/REENTRANT -D_GNU_SOURCE/LARGEFILE64_SOURCE/g' feeds/packages/lang/perl/perlmod.mk
sed -i 's#GO_PKG_TARGET_VARS.*# #g' feeds/packages/utils/v2dat/Makefile
			
#lede 不需要的初始化文件
rm -rf ./files/etc/init.d/kodexplorer