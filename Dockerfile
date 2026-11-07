FROM eclipse-temurin:17-jre

WORKDIR /proxy

# BungeeCordを事前にダウンロード
RUN curl -o BungeeCord.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar

COPY start.sh .
RUN chmod +x start.sh

EXPOSE 10000

CMD ["./start.sh"]
