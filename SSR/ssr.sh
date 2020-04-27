#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#======================================
# System required 18.04+
# SSR install script
# Version:1.0
# Author:curve
# Bolg:

config="/etc/SSR/config/config.json"
binary_bin="/etc/SSR/ssr/shadowsocks/server.py"
Install_SSR(){
	echo "即将在/etc/SSR目录下安装ssr"
	sleep 1
	[[ -e /etc/SSR ]] && echo "/etc/SSR 目录已经存在,如果原版本有问题,请先卸载,再安装" && exit 1
	mkdir /etc/SSR && cd /etc/SSR
	cd SSR
	wget -N --no-check-certificate "https://github.com/i-curve/MSR/archive/1.0.zip"
	unzip 1.0.zip && cp MSR-1.0/MSR.zip ./ && rm -rf 1.0.zip MSR-1.0/ 
	mkdir config ssr && unzip -d ssr MSR.zip && rm MSR.zip
	cp ssr/config.json $config
	echo "请进/etc/SSR/config文件下修改配置文件"
	exit(0)
}
Uninstall_SSR(){
	if [[ -e /etc/SSR ]];then
		rm -rf /etc/SSR &&
		[[ -e /etc/SSR ]]&&echo "删除失败" && exit 1
	echo "删除成功"
	fi
}

Start(){
	nohup python3 $binary_bin m -c $config &
}