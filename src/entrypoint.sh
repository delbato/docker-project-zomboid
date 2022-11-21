#! /bin/bash

check_if_installed () {
    echo false
}

install_server () {
    echo "Chosen username and password: $STEAM_USERNAME:$STEAM_PASSWORD"
    echo "I am: $(whoami)"
    echo "My home directory is: $HOME"
    steamcmd +force_install_dir /server +login anonymous +app_update 380870 validate +quit
}

installed=$(check_if_installed)
if [ $installed = "false" ]; then
    echo "Server is not installed, installing..."
    install_server
fi