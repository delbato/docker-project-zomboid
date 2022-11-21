FROM steamcmd/steamcmd:alpine-3

RUN mkdir -p /src
RUN mkdir -p /server
RUN mkdir -p /root/Zomboid
COPY ./src/* /src

VOLUME [ "/server" ]
VOLUME [ "/root/Zomboid" ]

EXPOSE 16261/udp 16262/udp

ENTRYPOINT [ "sh" , "/src/entrypoint.sh" ]