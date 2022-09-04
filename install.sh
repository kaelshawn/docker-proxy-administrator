#!/bin/bash
F="proxy-admin_linux-amd64.tar.gz"
set -e
if [ -e ~/proxy ]; then
    rm -rf ~/proxy
fi
mkdir ~/proxy
cd ~/proxy
echo -e "\n>>> downloading ... $F\n"

manual="https://snail.gitee.io/proxy/manual/zh/"
LAST_VERSION=v3.7
wget  -t 1 "https://mirrors.host900.com/https://github.com/snail007/proxy_admin_free/releases/download/${LAST_VERSION}/$F"

echo -e ">>> installing ... \n"
#install proxy-admin
tar zxvf $F >/dev/null 2>&1 
chmod +x proxy-admin
set +e
./proxy-admin uninstall >/dev/null 2>&1 
set -e
./proxy-admin install
rm $F