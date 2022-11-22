#! /bin/bash

check_if_installed () {
    if [[ -f /home/zomboid/Server/installed ]]; then
        echo true
    else
        echo false
    fi
}

install_server () {
    echo "Installing server..."
    cd /opt/steamcmd
    bash /opt/steamcmd/steamcmd.sh +force_install_dir /home/zomboid/Server +login anonymous +app_update 380870 validate +quit
    echo "Server installed."
    touch /home/zomboid/Server/installed
}

run_server () {
    cd /home/zomboid/Server
    ls -lah /home/zomboid/Zomboid
    bash start-server.sh -adminusername $SERVER_ADMIN_USERNAME -adminpassword $SERVER_ADMIN_PASSWORD -servername $SERVER_NAME
}

installed=$(check_if_installed)

whoami
id -u
id -g 
echo $HOME
ls -lah $HOME
ls -lah /home/zomboid/Server

if [[ $installed = "false" ]]; then
    echo "Server is not installed, installing..."
    install_server
else
    echo "Server is already installed."
fi

echo "Running server..."
run_server