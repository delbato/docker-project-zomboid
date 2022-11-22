FROM steamcmd/steamcmd:ubuntu-20 as builder

RUN mkdir -p /server

RUN steamcmd +force_install_dir /server +login anonymous +app_update 380870 validate +quit

FROM frolvlad/alpine-glibc:alpine-3.16

RUN apk add bash
RUN addgroup zomboid
RUN adduser -D zomboid -G zomboid

RUN mkdir -p /home/zomboid/Server
COPY src/entrypoint.sh /home/zomboid/entrypoint.sh
COPY --from=builder /server/* /home/zomboid/Server/
RUN chown zomboid:zomboid -R /home/zomboid

USER zomboid
ENTRYPOINT [ "bash", "/home/zomboid/entrypoint.sh" ]