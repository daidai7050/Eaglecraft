#!/bin/sh
mkdir -p /proxy/plugins
if [ -d "plugins" ]; then
  cp -rf plugins/* /proxy/plugins/
fi

cp -f config.yml /proxy/config.yml

# ログ出力の文字コードとIPv4優先の設定を追加して実行
exec java -Xmx400M -Xms400M -Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=true -jar BungeeCord.jar
