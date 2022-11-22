FROM steamcmd/steamcmd:ubuntu-20 as builder

RUN mkdir -p /server

RUN steamcmd +force_install_dir /server +login anonymous +app_update 380870 validate +quit

FROM frolvlad/alpine-glibc:alpine-3.16

RUN addgroup zomboid
RUN adduser -D zomboid -G zomboid

COPY src/entrypoint.sh /bin/entrypoint
RUN chmod u=rwx,g=rwx,o=rx /bin/entrypoint

USER zomboid
RUN mkdir -p /home/zomboid/Server
COPY --from=builder /server/* /home/zomboid/Server/

ENTRYPOINT [ "entrypoint" ]