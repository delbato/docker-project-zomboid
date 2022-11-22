#! /bin/bash

run_server () {
    cd /home/zomboid/Server
    sh start-server.sh -servername $SERVER_NAME
}

run_server