#!/bin/bash
echo 'The process will install the version nginx-1.16.1'
read -p 'Y/N:' check
sudo apt-get update
sudo apt-get -y install openssl libssl-dev libpcre3 libpcre3-dev zlib1g-dev g++

cd /opt
mkdir nginx-source nginx
cd nginx-source
wget http://nginx.org/download/nginx-1.16.1.tar.gz
tar zxvf nginx-1.16.1.tar.gz && rm nginx-1.16.1.tar.gz
cd nginx-1.16.1
./configure --prefix=/opt/nginx
make
make install


