FROM eclipse-temurin:19-alpine

WORKDIR /opt/mirai

RUN apk add curl ca-certificates wget screen 

RUN wget -q $(curl -s https://api.github.com/repos/iTXTech/mirai-console-loader/releases | grep browser_download_url | grep -m1 "mcl-.*.zip" | cut -d '"' -f 4) -O ./mcl.zip\
   && unzip mcl.zip -d ./mcl \
   && rm mcl.zip


CMD [ "java", "-jar", "./mcl/mcl.jar" ]