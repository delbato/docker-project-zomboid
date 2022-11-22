FROM steamcmd/steamcmd:alpine-3
RUN addgroup zomboid
RUN adduser -D zomboid -G zomboid

RUN mkdir -p /home/zomboid/Server

EXPOSE 16261/udp 16262/udp
VOLUME [ "/home/zomboid/Zomboid", "/home/zomboid/Server" ]

COPY src/entrypoint.sh /home/zomboid/entrypoint.sh

RUN chown -R zomboid:zomboid /home/zomboid

USER zomboid
ENTRYPOINT [ "bash", "/home/zomboid/entrypoint.sh" ]