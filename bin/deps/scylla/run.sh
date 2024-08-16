#!/usr/bin/env bash

if docker ps | grep -q scylla; then
    echo "Scylla already running"
elif docker ps -a | grep -q scylla; then
    echo "Starting existing scylla container"
    docker start scylla
else
    echo "Starting new scylla container"
    docker run --name scylla -d scylladb/scylla --developer-mode 1
fi

# INFO  2024-04-27 01:29:27,352 [shard  0:stat] cql_server_controller - Starting listening for CQL clients on 172.17.0.2:9042 (unencrypted, non-shard-aware)
# INFO  2024-04-27 01:29:27,352 [shard  0:stat] cql_server_controller - Starting listening for CQL clients on 172.17.0.2:19042 (unencrypted, shard-aware)