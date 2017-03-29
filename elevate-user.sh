#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    exit 1;
fi


echo "$1 ALL=(ALL:ALL) NOPASSWD:SETENV: /usr/bin/dokku" >> /etc/sudoers
