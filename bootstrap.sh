#!/bin/bash

# Setup Firewall
# Allow SSH
ufw allow 22
# Allow HTTP
ufw allow 80
# Allow HTTPS
ufw allow 443

# Turn Firewall on
ufw -f enable

# Install dokku
# Need both DOKKU_VHOST_ENABLE and VHOST_ENABLE
# https://github.com/dokku/dokku/pull/2408
KEY_FILE=/tmp/userkey
head -1 $HOME/.ssh/authorized_keys > $KEY_FILE
wget https://raw.githubusercontent.com/dokku/dokku/v0.7.1/bootstrap.sh
sudo DOKKU_TAG=v0.7.1 \
  DOKKU_VHOST_ENABLE=true \
  VHOST_ENABLE=true \
  DOKKU_WEB_CONFIG=false \
  DOKKU_HOSTNAME="thedark.cloud" \
  DOKKU_SKIP_KEY_FILE=false \
  DOKKU_KEY_FILE=$KEY_FILE \
  bash bootstrap.sh

# Setup Dokku plugins
# Let's Encrypt
dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git

# Setup apps
dokku apps:create jamescscott.io
