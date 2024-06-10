#############################################
###拷贝章鱼星球配置

git clone https://github.com/rmoyulong/AX6-Actions_Lede AX6-Actions_Lede

#如果files文件夹不存在，创建文件夹
if [ ! -d "./files" ]; then
  mkdir ./files
fi

cp -rf AX6-Actions_Lede/union_files/$1/* ./files
rm -rf AX6-Actions_Lede
#################################################################

dos2unix ./files/etc/*.sh
dos2unix ./files/etc/rc.*
chmod -Rf 755 ./files/etc/*.sh
chmod -Rf 755 ./files/etc/rc.*
chmod -Rf 755 ./files/etc/init.d/*
          
#aria2
chmod -R 777 ./files/etc/aria2
chmod -R 777 ./files/mnt/sda1/aria2
chmod -R 777 ./files/mnt/sda1/aria2/download
chmod -R 755 ./files/mnt/sda1/share