#!/bin/sh
mkdir -p plugins

# EaglerXBungeeプラグインが存在しない場合はダウンロード
if [ ! -f plugins/EaglerXBungee.jar ]; then
  wget -O plugins/EaglerXBungee.jar https://github.com/lax1dude/eagl3rxbungee/releases/latest/download/EaglerXBungee.jar || true
fi

# config.yml を配置
cp -f config.yml /proxy/config.yml

# BungeeCordの実行
exec java -Xmx400M -Xms400M -jar BungeeCord.jar
