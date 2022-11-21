#! /bin/bash

check_if_installed () {
    ls /server
    if [ -f /server/ProjectZomboid64 ]; then
        echo true
    else
        echo false
    fi
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

run_server () {
    cd /server
    pwd
    ls -lah $(pwd)
    ls -lah /server/jre64/bin
    sh start-server.sh
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