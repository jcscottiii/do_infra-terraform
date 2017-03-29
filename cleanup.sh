#!/bin/bash

dokku letsencrypt:auto-renew

#Disable root login
sed -i -e '/^PermitRootLogin/s/^.*$/PermitRootLogin no/' /etc/ssh/sshd_config

# Disable Password
sed -i -e '/^ChallengeResponseAuthentication/s/^.*$/ChallengeResponseAuthentication no/' /etc/ssh/sshd_config
sed -i -e '/^#PasswordAuthentication/s/^.*$/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i -e '/^UsePAM/s/^.*$/UsePAM no/' /etc/ssh/sshd_config

service ssh restart
