#############################################
###拷贝meson amlogic soc架构
git clone https://github.com/rmoyulong/OneCloud_OpenWrt OneCloud
if [[ "$2" == *"onecloud-amlogic.config"* ]]; then
  mv OneCloud/lede6.6/target/linux/amlogic target/linux/amlogic
  chmod -Rf 755 target/linux/amlogic
else
  mv OneCloud/lede6.6/target/linux/meson target/linux/meson
  chmod -Rf 755 target/linux/meson
fi

#如果files文件夹不存在，创建文件夹
if [ ! -d "./files" ]; then
  mkdir ./files
fi

cp -rf OneCloud/onecloud/files/* ./files
rm -rf OneCloud
##############################################

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
