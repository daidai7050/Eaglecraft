#!/bin/sh
mkdir -p plugins

# config.yml を配置
cp -f config.yml /proxy/config.yml

# BungeeCordの実行
exec java -Xmx400M -Xms400M -jar BungeeCord.jar
