#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit

./deps/redpanda/run.sh
./deps/scylla/run.sh