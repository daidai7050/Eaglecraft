FROM eclipse-temurin:17-jre

WORKDIR /app

# 依存ツールのインストール
RUN apt-get update && apt-get install -y curl ca-certificates && rm -rf /var/lib/apt/lists/*

# EaglerXBungee推奨の BungeeCord.jar (ビルド #1893) を直接ダウンロード
RUN curl -L -o BungeeCord.jar https://ci.md-5.net/job/BungeeCord/1893/artifact/bootstrap/target/BungeeCord.jar

# 必要なフォルダの作成
RUN mkdir -p plugins/EaglerXBungee

# プラグイン・設定ファイルをコンテナ内にコピー
COPY plugins/ plugins/
COPY config.yml config.yml

# ポートの公開 (RenderのWebサービス用)
EXPOSE 10000

# BungeeCordの起動
CMD ["java", "-Xms512M", "-Xmx512M", "-jar", "BungeeCord.jar"]
