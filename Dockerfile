FROM alpine:3

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories

RUN apk add --no-cache curl ca-certificates wget openjdk11


WORKDIR /opt/mirai

RUN wget -q $(curl -s https://api.github.com/repos/iTXTech/mirai-console-loader/releases | grep browser_download_url | grep -m1 "mcl-.*.zip" | cut -d '"' -f 4) -O ./mcl.zip\
   && unzip mcl.zip -d ./mcl \
   && rm mcl.zip

WORKDIR /opt/mirai/mcl

RUN ./mcl --update-package net.mamoe:mirai-api-http --channel stable-v2 --type plugin

CMD [ "java", "-jar", "mcl.jar" ]