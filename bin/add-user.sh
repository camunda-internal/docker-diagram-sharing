#!/bin/sh

if [ $# -lt 2 ]; then
  echo "usage: $0 USERNAME PASSWORD [ADDITIONAL_GROUPS]"
  exit 1
fi

USERNAME=$1
PASSWORD=$2
ADDITIONAL_GROUPS=$3
if [ -n "$ADDITIONAL_GROUPS" ]; then
  ADDITIONAL_GROUPS="-G $ADDITIONAL_GROUPS"
fi

useradd -U -m -s /bin/bash $ADDITIONAL_GROUPS $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd
