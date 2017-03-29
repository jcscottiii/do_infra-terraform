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
export DOKKU_TAG=v0.8.2
wget "https://raw.githubusercontent.com/dokku/dokku/$DOKKU_TAG/bootstrap.sh"
sudo DOKKU_VHOST_ENABLE=true \
  VHOST_ENABLE=true \
  DOKKU_WEB_CONFIG=false \
  DOKKU_HOSTNAME="thedark.cloud" \
  DOKKU_SKIP_KEY_FILE=false \
  DOKKU_KEY_FILE=$KEY_FILE \
  bash bootstrap.sh

# Setup Dokku plugins
# Let's Encrypt
dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git
# Redirect plugin
dokku plugin:install https://github.com/dokku/dokku-redirect.git

# Setup apps
dokku apps:create jamescscott.io
dokku domains:add jamescscott.io jamescscott.io
dokku redirect:set jamescscott.io www.jamescscott.io jamescscott.io
dokku apps:create staging-alishaplusjames
dokku domains:add staging-alishaplusjames staging.alishaplusjames.com
dokku apps:create alishaplusjames
dokku domains:add alishaplusjames alishaplusjames.com
dokku redirect:set alishaplusjames www.alishaplusjames.com alishaplusjames.com
