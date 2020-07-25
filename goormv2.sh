#!/bin/bash
#下载核心程序
apt-get -y update
apt-get install -y screen
rm -rf /v2ray
mkdir /v2ray
cd /v2ray
rm -f /v2ray/v2ray
wget --no-check-certificate https://github.com/byxiaopeng/goorm-v2ray/raw/master/v2ray
#设置运行权限
chmod +x /v2ray/v2ray
rm -f /v2ray/v2ctl
wget --no-check-certificate https://github.com/byxiaopeng/goorm-v2ray/raw/master/v2ctl
chmod +x /v2ray/v2ctl
rm -f /v2ray/config.json
wget --no-check-certificate https://github.com/byxiaopeng/goorm-v2ray/raw/master/config.json
rm -f /v2ray/1.key
wget --no-check-certificate https://github.com/byxiaopeng/goorm-v2ray/raw/master/1.key
rm -f /v2ray/1.crt
wget --no-check-certificate https://github.com/byxiaopeng/goorm-v2ray/raw/master/1.crt

#修改系统为北京时间
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

screen -S v2
/v2ray/v2ray -config=/v2ray/config.json
# 开始后台运行
#nohup /v2ray/v2ray -config=/v2ray/config.json >out.txt 2>&1 &
