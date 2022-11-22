FROM steamcmd/steamcmd:alpine-3.16
RUN addgroup zomboid
RUN adduser -D zomboid -G zomboid

RUN mkdir -p /home/zomboid/Server
COPY src/entrypoint.sh /home/zomboid/entrypoint.sh
COPY --from=builder /server/* /home/zomboid/Server/
RUN chown zomboid:zomboid -R /home/zomboid

USER zomboid
ENTRYPOINT [ "bash", "/home/zomboid/entrypoint.sh" ]