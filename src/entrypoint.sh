#! /bin/bash

run_server () {
    cd /home/zomboid/Server
    bash start-server.sh -servername $SERVER_NAME
}

run_server