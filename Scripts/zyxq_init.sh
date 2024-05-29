dos2unix ${GITHUB_WORKSPACE}/$1/etc/*.sh
dos2unix ${GITHUB_WORKSPACE}/$1/etc/rc.*
chmod -Rf 755 ${GITHUB_WORKSPACE}/$1/etc/*.sh
chmod -Rf 755 ${GITHUB_WORKSPACE}/$1/etc/rc.*
chmod -Rf 755 ${GITHUB_WORKSPACE}/$1/etc/init.d/*
          
#aria2
chmod -R 777 ${GITHUB_WORKSPACE}/$1/etc/aria2
chmod -R 777 ${GITHUB_WORKSPACE}/$1/mnt/sda1/aria2
chmod -R 777 ${GITHUB_WORKSPACE}/$1/mnt/sda1/aria2/download
chmod -R 755 ${GITHUB_WORKSPACE}/$1/mnt/sda1/share
		  
sed -i 's/REENTRANT -D_GNU_SOURCE/LARGEFILE64_SOURCE/g' feeds/packages/lang/perl/perlmod.mk