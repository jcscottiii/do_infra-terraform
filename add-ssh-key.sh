#!/bin/bash
#1 key name
#2 ssh key
if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    exit 1;
fi
set -x
echo $2 | dokku ssh-keys:add $1
set +x
