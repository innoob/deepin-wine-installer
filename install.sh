#!/bin/sh

R='\033[1;31m'
G='\033[1;32m'
B='\033[1;36m'
Y='\033[1;33m'
P='\033[1;35m'
N='\033[0m'


inst_dwine() {
	echo "====================================================================="
	echo "deepin-wine当前有以下版本:"
	echo "1). deepin-wine_1.9 (历史稳定版) "
	echo "2). deepin-wine_2.18-2 (最新稳定版,deepin-helper部分依赖不支持,已修正)"
	echo "====================================================================="
	while [ 1=1 ]
	do
	read -p "请选择deepin-wine的版本[序号]：" version
	case $version in
	    1) version=1.9 break ;;
	    2) version=2.18-2 break ;;
	    *) echo "${R}[erro] 你的选择有错误，请重新选择!${N}" ;;
	esac
	done
	echo "${G}[info] 你选择的版本是deepin-wine_$version ${N}"

	echo "${B}[info] 正在安装基础依赖包...${N}"
	sudo apt-get install lib32z1 lib32ncurses5 p7zip p7zip-full libp11-kit0:i386 libxt6:i386 ocl-icd-libopencl1:i386 odbcinst:i386 odbcinst1debian2:i386 p11-kit-modules:i386 unixodbc:i386 libp11-kit-gnome-keyring:i386
	echo "${G}[info] 基础依赖包安装完成!${N}"
	echo "${B}[info] 正在安装wine共有依赖包...${N}"
	sudo dpkg -i deepin-wine_commons/*.deb
	echo "${G}[info] wine共有依赖包安装完成!${N}"
	echo "${B}[info] 正在安装deepin-wine依赖包...${N}"
	sudo dpkg -i deepin-wine_$version/deepin-wine-dependency/*.deb
	echo "${G}[info] deepin-wine依赖包安装完成!${N}"
	echo "${B}[info] 正在安装deepin-wine-helper依赖包...${N}"
	sudo dpkg -i deepin-wine_$version/deepin-wine-helper-dependency/*.deb
	echo "${G}[info] deepin-wine-helper依赖包安装完成!${N}"
	echo "${B}[info] 正在修复未满足的依赖...${N}"
	sudo apt-get install -f
	echo "${G}[info] 修复依赖完成!${N}"
	echo "${B}[info] 正在刷新共享动态链接库...${N}"
	sudo ldconfig
	echo "${G}[info] 完成!${N}"
	echo "${G}[info] deepin-wine已经安装完成!${N}"

}

inst_software() {
	read -p "是否需要安装基于 deepin-wine 的软件(TIM,QQ,迅雷...)？[y/n]" ch
	if [ ! -d "./software" ]; then
		mkdir software
	fi
	while [ 1=1 ]
	do
	if [ "$ch" = "y" ];then
	echo "========================================================"
	echo "目前可以安装以下软件:"
	echo "1). TIM (deepin.com.qq.office) version:2.0"
	echo "2). QQ (deepin.com.qq.im) version:8.9"
	echo "3). QQ轻聊版 (deepin.com.qq.im.light) version:7.9"
	echo "4). 迅雷 (deepin.com.thunderspeed) version:7.10.35"
	echo "5). 微信 (deepin.com.wechat) version:2.6.2"
	echo "========================================================"
	read -p "请选择你要安装的软件[序号]：" soft
	case $soft in
		1) 
		echo "${B}[info] 正在检查本地安装包...${N}"
		if [ ! -f "./software/deepin.com.qq.office.deb" ]; then
			echo "${Y}[warn] 安装包未下载到本地!${N}"
			echo "${B}[info] 正在从源地址下载TIM （deepin.com.qq.office)...${N}"
			wget -O ./software/deepin.com.qq.office.deb https://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.office/deepin.com.qq.office_2.0.0deepin4_i386.deb
			echo "${G}[info] 下载TIM （deepin.com.qq.office) 完成!${N}"
		fi
		echo "${B}[info] 正在安装TIM (deepin.com.qq.office)...${N}"
		sudo dpkg -i software/deepin.com.qq.office.deb 
		echo "${G}[info] 安装TIM (deepin.com.qq.office) 完成!${N}"
	;;
		2) 
		echo "${B}[info] 正在检查本地安装包...${N}"
		if [ ! -f "./software/deepin.com.qq.im.deb" ]; then
			echo "${Y}[warn] 安装包未下载到本地!${N}"
			echo "${B}[info] 正在从源地址下载QQ （deepin.com.qq.im)...${N}"
			wget -O ./software/deepin.com.qq.im.deb https://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.im/deepin.com.qq.im_8.9.19983deepin23_i386.deb
			echo "${G}[info] 下载QQ （deepin.com.qq.im) 完成!${N}"
		fi
		echo "${B}[info] 正在安装QQ  (deepin.com.qq.im)...${N}"
		sudo dpkg -i software/deepin.com.qq.im.deb 
		echo "${G}[info] 安装QQ  (deepin.com.qq.im) 完成!${N}"
	;;
		3) 
		echo "${B}[info] 正在检查本地安装包...${N}"
		if [ ! -f "./software/deepin.com.qq.im.light.deb" ]; then
			echo "${Y}[warn] 安装包未下载到本地!${N}"
			echo "${B}[info] 正在从源地址下载QQ轻聊版（deepin.com.qq.im.light)...${N}"
			wget -O ./software/deepin.com.qq.im.light.deb https://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.qq.im.light/deepin.com.qq.im.light_7.9.14308deepin8_i386.deb
			echo "${G}[info] 下载QQ轻聊版（deepin.com.qq.im.light) 完成!${N}"
		fi
		echo "${B}[info] 正在安装QQ轻聊版 (deepin.com.qq.im.light)...${N}"
		sudo dpkg -i software/deepin.com.qq.im.light.deb 
		echo "${G}[info] 安装QQ轻聊版 (deepin.com.qq.im.light) 完成!${N}"
	;;
		4) 
		echo "${B}[info] 正在检查本地安装包...${N}"
		if [ ! -f "./software/deepin.com.thunderspeed.deb" ]; then
			echo "${Y}[warn] 安装包未下载到本地!${N}"
			echo "${B}[info] 正在从源地址下载迅雷（deepin.com.thunderspeed)...${N}"
			wget -O ./software/deepin.com.thunderspeed.deb https://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.thunderspeed/deepin.com.thunderspeed_7.10.35.366deepin17_i386.deb
			echo "${G}[info] 下载迅雷（deepin.com.thunderspeed) 完成!${N}"
		fi
		echo "${B}[info] 正在安装迅雷 (deepin.com.thunderspeed)...${N}"
		sudo dpkg -i software/deepin.com.thunderspeed.deb 
		echo "${G}[info] 安装迅雷 (deepin.com.thunderspeed) 完成!${N}"
	;;
	5) 
		echo "${B}[info] 正在检查本地安装包...${N}"
		if [ ! -f "./software/deepin.com.wechat.deb" ]; then
			echo "${Y}[warn] 安装包未下载到本地!${N}"
			echo "${B}[info] 正在从源地址下载微信（deepin.com.wechat)...${N}"
			wget -O ./software/deepin.com.wechat.deb https://mirrors.aliyun.com/deepin/pool/non-free/d/deepin.com.wechat/deepin.com.wechat_2.6.2.31deepin0_i386.deb
			echo "${G}[info] 下载微信（deepin.com.wechat) 完成!${N}"
		fi
		echo "${B}[info] 正在安装微信（deepin.com.wechat)...${N}"
		sudo dpkg -i software/deepin.com.wechat.deb 
		echo "${G}[info] 安装微信（deepin.com.wechat) 完成!${N}"
	;;
		*) echo "${R}[erro] 你的选择有错误，请重新选择!${N}" ;;
	esac
		read -p "是否还要安装其他的deepin-wine软件？[y/n]" ch
	else
		echo "${B}[info] 正在进行最后的完整包依赖检查...${N}"
		sudo apt-get install -f
		echo "${G}[info] 依赖修复完成!${N}"
		echo "${P}\n            请尽请使用deepin-wine的软件吧!\n${N}"
	exit
	fi
	done

}

echo "${B}[info] 正在检测deepin-wine是否已经存在您的系统中...${N}"
if [ -f "/usr/bin/deepin-wine" ]; then
  if [ -d "/usr/lib/deepin-wine" ]; then
    if [ -d "/usr/share/deepin-wine" ]; then
		echo "${G}[info] 您的系统中已经安装了deepin-wine,已为您跳过安装步骤!${N}"
		inst_software
	else
		echo "${Y}[warn] 您的系统中尚未安装deepin-wine.${N}"
		inst_dwine
    fi
	else
	echo "${R}[erro] 您的系统中曾经安装过deepin-wine,但现已损坏，请重新安装!${N}"
	inst_dwine
  fi
  else
  echo "${R}[erro] 您的系统中曾经安装过deepin-wine,但现已损坏，请重新安装!${N}"
	inst_dwine
fi
