FROM eclipse-temurin:17-jre

WORKDIR /app

RUN apt-get update && apt-get install -y curl ca-certificates && rm -rf /var/lib/apt/lists/*

# EaglerXBungee推奨の BungeeCord.jar (ビルド #1893) を直接取得
RUN curl -L -o BungeeCord.jar https://ci.md-5.net/job/BungeeCord/1893/artifact/bootstrap/target/BungeeCord.jar

# 必要なフォルダを作成
RUN mkdir -p plugins/EaglerXBungee

# 設定・プラグインを書き込み
COPY plugins/ plugins/
COPY config.yml config.yml

EXPOSE 10000

CMD ["java", "-Xms512M", "-Xmx512M", "-DeaglerBungee.stfu=true", "-jar", "BungeeCord.jar"]
