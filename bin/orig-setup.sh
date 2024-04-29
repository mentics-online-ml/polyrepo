#!/usr/bin/env bash
SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")
source "$SCRIPT_DIR"/common.sh

script=$(basename "$0")

mapfile -t NAMES < repo.list
cmds=()
for NAME in "${NAMES[@]}"; do
    cmds+=("git submodule add git@github.com:mentics-ml-demo/'${NAME}'.git '${NAME}'")
done

run_parallel "${script}" "${cmds[@]}"
