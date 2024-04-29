#!/usr/bin/env bash

# git submodule update --recursive --remote

. "${BASH_SOURCE%/*}/common.sh"

submodule_foreach_parallel "git pull"
