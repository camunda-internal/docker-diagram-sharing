#!/bin/bash

if [ $# -ne 1 ]; then
  echo "usage: $0 PLACEHOLDER_TXT"
  exit 1
fi

while read line; do
  read -a array <<< "$line"
  # format: file placeholder replacement
  sed -i "s!%${array[1]}%!${array[2]}!g" ${array[0]}
done < $1
