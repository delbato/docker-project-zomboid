#! /bin/bash

echo "Chosen username and password: $STEAM_USERNAME:$STEAM_PASSWORD"
env

check_if_installed () {
    echo false
}

install_server () {
    if [ -z "${STEAM_USERNAME}" ] && [ -z $STEAM_PASSWORD ]; then
        echo "Installing anonymously."
        steamcmd +force_install_dir /server +login anonymous +app_update 380870 validate +quit
    else
        echo "Installing with steam account.";
        steamcmd +force_install_dir /server +login $STEAM_USERNAME $STEAM_PASSWORD +app_update 380870 validate +quit
    fi
    echo "I am: $(whoami)"
    echo "My home directory is: $HOME"
}

installed=$(check_if_installed)
if [ $installed = "false" ]; then
    echo "Server is not installed, installing..."
    install_server
fi