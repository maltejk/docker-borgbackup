#!/bin/sh
mkdir -p /etc/borgmatic
envsubst < /config/borgmatic.yaml.tpl > /etc/borgmatic/config.yaml
envsubst < /config/crontab.tpl > /etc/crontabs/root

BORG_REPO_HOSTNAME="$(echo $BORG_REPO | cut -d '@' -f 2 | cut -d ':' -f 1)"
ssh-keygen -F $BORG_REPO_HOSTNAME || ssh-keyscan $BORG_REPO_HOSTNAME >> /root/.ssh/known_hosts

borgmatic list || borgmatic init -e repokey-blake2

exec crond -f -d 8
