#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")" || exit

# https://docs.redpanda.com/current/get-started/quick-start/

if docker ps | grep -q redpanda; then
    echo "RedPanda already running"
else
    echo "Starting RedPanda"
    docker compose up -d
fi

# TODO: wait for docker containers to be ready
# docker exec -it redpanda-0 rpk topic create raw event label
