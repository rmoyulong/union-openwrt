sudo apt install android-sdk-libsparse-utils
ver="v0.3.2"
curl -L -o ./AmlImg https://github.com/rmoyulong/AmlImg/releases/download/$ver/AmlImg_${ver}_linux_amd64
chmod +x ./AmlImg
curl -L -o ./uboot.img https://github.com/rmoyulong/u-boot-onecloud/releases/download/Onecloud_Uboot_23.12.24_18.15.09/eMMC.burn.img
./AmlImg unpack ./uboot.img burn/

mkdir rootfs_path
mkdir mount_rootfs

files=$(ls openwrt/bin/targets/*/*/*.tar 2> /dev/null | wc -l)
cd rootfs_path
if [ "$files" != "0" ]; then
    tarfile=$(ls ../openwrt/bin/targets/*/*/*rootfs.tar)
    #sudo cp $tarfile .
    #tarfile=$(ls ./*rootfs.tar)
    sudo tar xvfp $tarfile
	#sudo rm -r *.tar
	#sudo mv $tarfile ../openwrt/bin/targets/armsr/armv7/openwrt_meson8b_thunder_armv7_onecloud_rootfs.tar
	prefix_ext=0
    echo "解压$tarfile"
  else
    tarfile=$(ls ../openwrt/bin/targets/*/*/*rootfs.tar.gz)
    #sudo cp $tarfile .
    #tarfile=$(ls ./*rootfs.tar.gz)
    sudo tar zxvfp $tarfile
	#sudo rm -r *.tar.gz
	#sudo mv $tarfile ../openwrt/bin/targets/armsr/armv7/openwrt_meson8b_thunder_armv7_onecloud_rootfs.tar.gz
	prefix_ext=1
    echo "解压$tarfile"
fi

cd ..
sudo dd if=/dev/zero of=openwrt.img bs=1M count=2000
sudo mkfs.ext4 openwrt.img
sudo mount openwrt.img mount_rootfs
cd mount_rootfs
sudo cp -rf ../rootfs_path/* .
cd ..
sudo sync
sudo umount mount_rootfs
#sudo img2simg ${loop}p1 burn/boot.simg
#mv $GITHUB_WORKSPACE/lede6.12/boot.PARTITION burn/boot.simg
git clone  https://github.com/rmoyulong/OneCloud_OpenWrt patchs
cp -rf ./patchs/lede6.12/boot.PARTITION burn/boot.simg
sudo img2simg openwrt.img burn/rootfs.simg
sudo rm -rf *.img
cat <<EOF >>burn/commands.txt
PARTITION:boot:sparse:boot.simg
PARTITION:rootfs:sparse:rootfs.simg
EOF

if [ $prefix_ext == 1 ]; then
  prefix=$(ls openwrt/bin/targets/*/*/*rootfs.tar.gz | sed 's/\rootfs.tar.gz$//')
else
  prefix=$(ls openwrt/bin/targets/*/*/*rootfs.tar | sed 's/\rootfs.tar$//')
fi

burnimg=${prefix}.OneCloud.burn.img
./AmlImg pack $burnimg burn/
for f in openwrt/bin/targets/*/*/*.burn.img; do
  sha256sum "$f" >"${f}.sha"
  xz -9 --threads=0 --compress "$f"
done
sudo rm -rf openwrt/bin/targets/*/*/*.img
#sudo rm -rf openwrt/bin/targets/*/*/*.gz