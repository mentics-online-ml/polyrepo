#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <topic> <offset>"
  exit 1
fi

docker exec -it redpanda-0 rpk topic trim-prefix "$1" --offset "$2"
