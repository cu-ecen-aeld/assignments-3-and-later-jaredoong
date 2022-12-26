#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Error: 2 arguments required"
  exit 1
fi

writedir="$1"
writestr="$2"

mkdir -p "$(dirname $writedir)"

echo $writestr > $writedir

if [ ! -f $writedir ]; then
  echo "Error: Unable to create file"
  exit 1
fi

echo "Successfully created file $writedir with content $writestr."
