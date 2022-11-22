FROM --platform=linux/amd64 steamcmd/steamcmd:alpine-3

RUN addgroup zomboid
RUN adduser -D zomboid -G zomboid -h /home/zomboid
RUN apk add dash
RUN apk add bash

RUN mkdir -p /home/zomboid/Server

EXPOSE 16261/udp 16262/udp
VOLUME [ "/home/zomboid/Zomboid", "/home/zomboid/Server" ]

COPY src/entrypoint.sh /home/zomboid/entrypoint.sh

RUN chown -R zomboid:zomboid /home/zomboid

USER zomboid
ENV HOME=/home/zomboid
ENTRYPOINT [ "bash", "/home/zomboid/entrypoint.sh" ]