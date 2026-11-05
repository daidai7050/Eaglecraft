FROM openjdk:8-jre-slim

WORKDIR /proxy

# BungeeCordのダウンロード
ADD https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar BungeeCord.jar

# 起動用スクリプトと設定ファイルのコピー
COPY start.sh .
RUN chmod +x start.sh

EXPOSE 8081

CMD ["./start.sh"]
