FROM eclipse-temurin:17-jre

WORKDIR /proxy

# dos2unix のインストールと JAR ファイルの正常ダウンロード（-L オプション追加）
RUN apt-get update && apt-get install -y dos2unix curl && \
    curl -L -o BungeeCord.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar

# スクリプトと設定の準備
COPY start.sh .
COPY config.yml .
COPY plugins ./plugins

RUN dos2unix start.sh && chmod +x start.sh

EXPOSE 10000

CMD ["./start.sh"]
