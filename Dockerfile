FROM eclipse-temurin:17-jre

WORKDIR /proxy

# BungeeCordのダウンロード
ADD https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar BungeeCord.jar

# 起動用スクリプトと設定ファイルのコピー
COPY start.sh .
RUN chmod +x start.sh

# Renderのヘルスチェック干渉を無効化
HEALTHCHECK NONE

EXPOSE 8081

CMD ["./start.sh"]
