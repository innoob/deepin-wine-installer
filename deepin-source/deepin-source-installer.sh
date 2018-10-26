#!/bin/sh
  
R='\033[1;31m'
G='\033[1;32m'
B='\033[1;36m'
Y='\033[1;33m'
P='\033[1;35m'
N='\033[0m'

echo "${B}[info] 正在添加deepin源列表...${N}"
sudo cp ./deepin-source.list /etc/apt/sources.list.d/
echo "${G}[info] 添加deepin源列表完成!${N}"
echo "${B}[info] 正在添加deepin源受信gpg-key...${N}"
sudo apt-key add 425956BB3E31DF51.asc
echo "${G}[info] 添加deepin源受信gpg-key完成!${N}"
echo "${B}[info] 正在添加i386库支持...${N}"
sudo dpkg --add-architecture i386
sudo dpkg --print-foreign-architectures
echo "${G}[info] 添加i386库完成!${N}"
echo "${B}[info] 正在整理libjpeg8依赖...${N}"
sudo dpkg -i 'libjpeg-turbo8_1.5.2-1ubuntu5.18.04.1_amd64.deb'
sudo dpkg -i 'libjpeg8_8c-2ubuntu8_amd64.deb'
sudo apt-get autoremove 'libjpeg-turbo8'
echo "${G}[info] 整理libjpeg8依赖完成!${N}"
echo "${B}[info] 正在更新源列表...${N}"
sudo apt-get update
echo "${G}[info] 更新源列表完成!${N}"

echo "${B}[info] 正在进行包依赖检查...${N}"
sudo apt-get install -f
echo "${G}[info] 依赖修复完成!${N}"

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
echo "========================================================"
read -p "请选择你要安装的软件[序号]：" soft
case $soft in
	1) 
	echo "${B}[info] 正在整理libasound2-plugins:i386依赖...${N}"
	sudo apt-get install 'libasound2-plugins:i386'
	echo "${G}[info] 整理libasound2-plugins:i386依赖完成!${N}"
	echo "${B}[info] 正在安装TIM (deepin.com.qq.office)...${N}"
	sudo apt-get install deepin.com.qq.office
	sudo apt-get install -f
	echo "${G}[info] 安装TIM (deepin.com.qq.office) 完成!${N}"
;;
	2) 
	echo "${B}[info] 正在整理libasound2-plugins:i386依赖...${N}"
	sudo apt-get install 'libasound2-plugins:i386'
	echo "${G}[info] 整理libasound2-plugins:i386依赖完成!${N}"
	echo "${B}[info] 正在安装QQ  (deepin.com.qq.im)...${N}"
	sudo apt-get install deepin.com.qq.im
	sudo apt-get install -f
	echo "${G}[info] 安装QQ  (deepin.com.qq.im) 完成!${N}"
;;
	3) 
	echo "${B}[info] 正在整理libasound2-plugins:i386依赖...${N}"
	sudo apt-get install 'libasound2-plugins:i386'
	echo "${G}[info] 整理libasound2-plugins:i386依赖完成!${N}"
	echo "${B}[info] 正在安装QQ轻聊版 (deepin.com.qq.im.light)...${N}"
	sudo apt-get install deepin.com.qq.im.light
	sudo apt-get install -f
	echo "${G}[info] 安装QQ轻聊版 (deepin.com.qq.im.light) 完成!${N}"
;;
	4) 
	echo "${B}[info] 正在整理libasound2-plugins:i386依赖...${N}"
	sudo apt-get install 'libasound2-plugins:i386'
	echo "${G}[info] 整理libasound2-plugins:i386依赖完成!${N}"
	echo "${B}[info] 正在安装迅雷 (deepin.com.thunderspeed)...${N}"
	sudo apt-get install deepin.com.thunderspeed
	sudo apt-get install -f
	echo "${G}[info] 安装迅雷 (deepin.com.thunderspeed) 完成!${N}"
;;
	*) echo "${R}[erro] 你的选择有错误，请重新选择!${N}" ;;
esac
	read -p "是否还要安装其他的deepin-wine软件？[y/n]" ch
else
	echo "${Y}[info] 正在进行最后的完整包依赖检查...${N}"
	sudo apt-get install -f
	echo "${G}[info] 依赖修复完成!${N}"
	echo "${Y}[info] 正在移除deepin源列表...${N}"
	sudo rm /etc/apt/sources.list.d/deepin-source.list
	echo "${G}[info] 移除deepin源列表完成!${N}"
	echo "${B}[info] 正在更新源列表...${N}"
	sudo apt-get update
	echo "${G}[info] 更新源列表完成!${N}"
	
	echo "${P}\n            请尽请使用deepin-wine的软件吧!\n${N}"
exit
fi
done


