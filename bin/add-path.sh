#!/bin/bash

RC=${RC:-/etc/profile.d/env.sh}

for path in $@; do
  echo "export PATH=$path:\$PATH" >> $RC
done
