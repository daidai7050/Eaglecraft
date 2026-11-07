#!/bin/sh
mkdir -p /proxy/plugins
if [ -d "plugins" ]; then
  cp -rf plugins/* /proxy/plugins/
fi

cp -f config.yml /proxy/config.yml

exec java -Xmx300M -Xms300M -Dfile.encoding=UTF-8 -Djava.net.preferIPv4Stack=true -jar BungeeCord.jar
