FROM debian:latest
WORKDIR /root
COPY . .
RUN apt update && apt install -y openjdk-8-jre-headless
RUN wget -O tc.tar.gz https://download-cf.jetbrains.com/teamcity/TeamCity-2018.2.4.tar.gz
RUN tar xzvf tc.tar.gz; rm tc.tar.gz

ENV TEAMCITY_DATA_PATH /data/teamcity_server/datadir
CMD ["TeamCity/bin/teamcity-server.sh","run"]
