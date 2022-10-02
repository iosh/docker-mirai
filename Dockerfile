FROM eclipse-temurin:19-alpine


RUN  apk add --no-cache curl ca-certificates wget 


WORKDIR /opt/mirai

RUN wget -q $(curl -s https://api.github.com/repos/iTXTech/mirai-console-loader/releases | grep browser_download_url | grep -m1 "mcl-.*.zip" | cut -d '"' -f 4) -O ./mcl.zip\
   && unzip mcl.zip -d ./mcl \
   && rm mcl.zip

WORKDIR /opt/mirai/mcl

RUN mkdir ./plugins &&\
   wget -q $(curl -s https://api.github.com/repos/project-mirai/mirai-api-http/releases | grep browser_download_url | grep -m1 ".*.jar" | cut -d '"' -f 4) -P ./plugins


CMD [ "java", "-jar", "mcl.jar" ]