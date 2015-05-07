#!/bin/bash

RC=${RC:-/etc/profile.d/env.sh}

for env in $@; do
  echo "export $env=${!env}" >> $RC
done
