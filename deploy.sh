#!/bin/bash

if [[ -z "$1" ]]; then
  echo "No argument supplied"
fi

IP_ADDRESS=$1

APPS=(
  "https://github.com/jcscottiii/jamescscott.io::jamescscott.io"
)
for index in "${APPS[@]}" ; do
    REPO="${index%%::*}"
    APP_NAME="${index##*::}"
    echo "$REPO - $APP_NAME"
    REPO_PATH=/tmp/$APP_NAME
    rm -rf $REPO_PATH
    git clone $REPO $REPO_PATH
    pushd $REPO_PATH
    git remote add dokku dokku@$IP_ADDRESS:$APP_NAME
    yes | git push dokku master:master
    popd
    rm -rf $REPO_PATH
    ssh -t root@$IP_ADDRESS dokku config:set --no-restart \
      $APP_NAME DOKKU_LETSENCRYPT_EMAIL=admin@jamescscott.io
    ssh -t root@$IP_ADDRESS dokku letsencrypt $APP_NAME
done
