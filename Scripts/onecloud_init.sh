#############################################
###拷贝meson amlogic soc架构

git clone https://github.com/rmoyulong/AX6-Actions_Lede AX6-Actions_Lede
if [[ "$2" == *"amlogic_meson8b_DEVICE_thunder-onecloud.config"* ]]; then
  cp -rf AX6-Actions_Lede/union_files/lede6.6/target/linux/amlogic target/linux
  #cp ${GITHUB_WORKSPACE}/patch/target.tar.gz .
  #tar zxvfp target.tar.gz
  chmod -Rf 755 target/linux/amlogic
else
  cp -rf AX6-Actions_Lede/union_files/lede6.6/target/linux/meson target/linux
  chmod -Rf 755 target/linux/meson
fi

#如果files文件夹不存在，创建文件夹
if [ ! -d "./files" ]; then
  mkdir ./files
fi

word=$1
cp -rf AX6-Actions_Lede/union_files${word/patch/}/* ./files
rm -rf AX6-Actions_Lede

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