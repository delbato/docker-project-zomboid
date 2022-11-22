#! /bin/bash

check_if_installed () {
    if [ -f /home/zomboid/installed ]; then
        echo true
    else
        echo false
    fi
}

install_server () {
    echo "Installing server..."
    steamcmd +force_install_dir /home/zomboid/Server +login anonymous +app_update 380870 validate +quit
    echo "Server installed."
    touch /home/zomboid/installed
}

run_server () {
    cd /home/zomboid/Server
    bash start-server.sh
}

installed=$(check_if_installed)
if [ $installed = "false" ]; then
    echo "Server is not installed, installing..."
    install_server
else
    echo "Server is already installed."
fi

echo "Running server..."
run_server