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
    steamcmd +force_install_dir /home/zomboid/Server +login anonymous +app_update 380870 validate +quit
    echo "Server installed."
    touch /home/zomboid/Server/installed
}

run_server () {
    cd /home/zomboid/Server
    chmod +x start-server.sh
    ./start-server.sh
}

installed=$(check_if_installed)

whoami
echo $HOME

if [[ $installed = "false" ]]; then
    echo "Server is not installed, installing..."
    install_server
else
    echo "Server is already installed."
fi

echo "Running server..."
run_server