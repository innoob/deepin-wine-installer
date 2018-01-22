#/bin/sh
clear
echo "\n"
echo "deepin-wine当前有一下版本:"
echo "1). deepin-wine_1.9 (历史稳定版) "
echo "2). deepin-wine_2.18 (最新稳定版,deepin-helper部分依赖不支持,已修正)"
echo "\n"
while [ 1=1 ]
do
read -p "请选择deepin-wine的版本[序号]：" version
case $version in
    1) version=1.9 break ;;
    2) version=2.18 break ;;
    *) echo "[error] 你的选择有错误，请重新选择!" ;;
esac
done
echo "[info] 你选择的版本是deepin-wine_$version"

echo "[info] 正在安装基础依赖包..."
sudo apt-get install lib32z1 lib32ncurses5 p7zip p7zip-full libp11-kit0:i386 libxt6:i386 ocl-icd-libopencl1:i386 odbcinst:i386 odbcinst1debian2:i386 p11-kit-modules:i386 unixodbc:i386 libp11-kit-gnome-keyring:i386
echo "[info] 基础依赖包安装完成!"
echo "[info] 正在安装wine共有依赖包..."
sudo dpkg -i deepin-wine_commons/*.deb
echo "[info] wine共有依赖包安装完成!"
echo "[info] 正在安装deepin-wine依赖包..."
sudo dpkg -i deepin-wine_$version/deepin-wine-dependency/*.deb
echo "[info] deepin-wine依赖包安装完成!"
echo "[info] 正在安装deepin-wine-helper依赖包..."
sudo dpkg -i deepin-wine_$version/deepin-wine-helper-dependency/*.deb
echo "[info] deepin-wine-helper依赖包安装完成!"
echo "[info] 正在修复未满足的依赖..."
sudo apt-get install -f
echo "[info] 修复依赖完成!"
echo "[info] 正在刷新共享动态链接库..."
sudo ldconfig
echo "[info] 完成!"
echo "[info] deepin-wine已经安装完成!"
read -p "是否需要安装deepin-wine软件？[y/n]" ch
mkdir software
while [ 1=1 ]
do
if [ "$ch" = "y" ];then
clear
echo "\n"
echo "可以安装以下软件:"
echo "1). TIM (deepin.com.qq.office) version:2.0"
echo "2). QQ (deepin.com.qq.im) version:8.9"
echo "3). QQ轻聊版 (deepin.com.qq.im.light) version:7.9"
echo "4). 迅雷 (deepin.com.thunderspeed) version:7.10.35"
read -p "请选择你要安装的软件[序号]：" soft
case $soft in
    1) 
	echo "[info] 正在从源地址下载TIM （deepin.com.qq.office)..."
	wget -O ./software/deepin.com.qq.office.deb http://mirrors.163.com/deepin/pool/non-free/d/deepin.com.qq.office/deepin.com.qq.office_2.0.0deepin1_i386.deb
	echo "[info] 下载TIM （deepin.com.qq.office) 完成!"
	echo "[info] 正在安装TIM (deepin.com.qq.office)..."
	sudo dpkg -i software/deepin.com.qq.office.deb 
	echo "[info] 安装TIM (deepin.com.qq.office) 完成!"
;;
    2) 
	echo "[info] 正在从源地址下载QQ （deepin.com.qq.im)..."
	wget -O ./software/deepin.com.qq.im.deb http://mirrors.163.com/deepin/pool/non-free/d/deepin.com.qq.im/deepin.com.qq.im_8.9.19983deepin19_i386.deb
	echo "[info] 下载QQ （deepin.com.qq.im) 完成!"
	echo "[info] 正在安装QQ  (deepin.com.qq.im)..."
	sudo dpkg -i software/deepin.com.qq.im.deb 
	echo "[info] 安装QQ  (deepin.com.qq.im) 完成!"
;;
    3) 
	echo "[info] 正在从源地址下载QQ轻聊版（deepin.com.qq.im.light)..."
	wget -O ./software/deepin.com.qq.im.light.deb http://mirrors.163.com/deepin/pool/non-free/d/deepin.com.qq.im.light/deepin.com.qq.im.light_7.9.14308deepin8_i386.deb
	echo "[info] 下载QQ轻聊版（deepin.com.qq.im.light) 完成!"
	echo "[info] 正在安装QQ轻聊版 (deepin.com.qq.im.light)..."
	sudo dpkg -i software/deepin.com.qq.im.light.deb 
	echo "[info] 安装QQ轻聊版 (deepin.com.qq.im.light) 完成!"
;;
    4) 
	echo "[info] 正在从源地址下载迅雷（deepin.com.thunderspeed)..."
	wget -O ./software/deepin.com.thunderspeed.deb http://mirrors.163.com/deepin/pool/non-free/d/deepin.com.thunderspeed/deepin.com.thunderspeed_7.10.35.366deepin17_i386.deb
	echo "[info] 下载迅雷（deepin.com.thunderspeed) 完成!"
	echo "[info] 正在安装迅雷 (deepin.com.thunderspeed)..."
	sudo dpkg -i software/deepin.com.thunderspeed.deb 
	echo "[info] 安装迅雷 (deepin.com.thunderspeed) 完成!"
;;
    *) echo "[error] 你的选择有错误，请重新选择!" ;;
esac
    read -p "是否还要安装其他的deepin-wine软件？[y/n]" ch
else
exit
fi
done
exit
