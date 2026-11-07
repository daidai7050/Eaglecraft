#!/bin/sh
# pluginsフォルダを作成し、中身をコピー
mkdir -p /proxy/plugins
if [ -d "plugins" ]; then
  cp -rf plugins/* /proxy/plugins/
fi

# config.yml を配置
cp -f config.yml /proxy/config.yml

# BungeeCordの実行
exec java -Xmx400M -Xms400M -jar BungeeCord.jar
