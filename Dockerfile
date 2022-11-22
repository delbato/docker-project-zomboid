FROM --platform=amd64 ubuntu:22.04

# create user for steam
RUN adduser \
	--home /home/zomboid \
	--disabled-password \
	--shell /bin/bash \
	--gecos "user for running the zomboid server" \
	--quiet \
	zomboid

# install dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Downloading SteamCMD and make the Steam directory owned by the steam user
RUN mkdir -p /opt/steamcmd &&\
    cd /opt/steamcmd &&\
    curl -s https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -vxz &&\
    chown -R zomboid /opt/steamcmd


# SteamCMD should not be used as root, here we set up user and variables
RUN mkdir -p /home/zomboid/Server
RUN mkdir -p /home/zomboid/Zomboid
RUN chown -r zomboid:zomboid /home/zomboid

USER zomboid
WORKDIR /home/zomboid

VOLUME [ "/home/zomboid/Server" ]
VOLUME [ "/home/zomboid/Zomboid" ]

EXPOSE 16261/udp
EXPOSE 16262/udp

COPY src/entrypoint.sh /home/zomboid/

# Execution vector
ENTRYPOINT [ "bash", "/home/zomboid/entrypoint.sh" ]