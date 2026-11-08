FROM eclipse-temurin:17-jre

WORKDIR /app

# 依存ツールのインストール
RUN apt-get update && apt-get install -y curl ca-certificates && rm -rf /var/lib/apt/lists/*

# Eaglercraft v1.8.8 動作確認済みの BungeeCord ビルドを取得
RUN curl -L -o BungeeCord.jar https://ci.md-5.net/job/BungeeCord/1645/artifact/bootstrap/target/BungeeCord.jar

# 必要なフォルダの作成
RUN mkdir -p plugins/EaglerXBungee

# プラグイン・設定ファイルをコピー
COPY plugins/ plugins/
COPY config.yml config.yml

EXPOSE 10000

CMD ["java", "-Xms512M", "-Xmx512M", "-DeaglerBungee.stfu=true", "-jar", "BungeeCord.jar"]
