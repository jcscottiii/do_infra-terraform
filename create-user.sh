#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    exit 1;
fi

# Create user
set -x
adduser "$1" --gecos "" --disabled-password
su - "$1" -c "mkdir -p .ssh && chmod 700 .ssh && echo $2 > .ssh/authorized_keys && chmod 600 .ssh/authorized_keys"
chage -d 0 "$1"
set +x
