#!/bin/sh

if [ $# -ne 2 ]; then
  echo "usage: $0 SSH_USER KEY_FILE"
  exit 1
fi

SSH_USER=$1
KEY_FILE=$2

SSH_DIR=/home/$SSH_USER/.ssh
AUTHORIZED_KEYS=$SSH_DIR/authorized_keys

grep -q "$(cut -d\  -f2 $KEY_FILE)" $AUTHORIZED_KEYS 2> /dev/null

if [ $? -eq 0 ]; then
  echo "ssh key already added"
  exit
else
  mkdir -p "$SSH_DIR"
  chmod 700 "$SSH_DIR"
  cat "$KEY_FILE" >> "$AUTHORIZED_KEYS"
  chown -R $SSH_USER:$SSH_USER "$SSH_DIR"
  echo "ssh key added"
fi

