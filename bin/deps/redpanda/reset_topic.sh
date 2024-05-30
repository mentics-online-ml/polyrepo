#!/usr/bin/env bash

docker exec -it redpanda-0 rpk topic delete "$1"
docker exec -it redpanda-0 rpk topic create "$1"
