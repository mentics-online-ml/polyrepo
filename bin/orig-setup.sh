#!/usr/bin/env bash
. "${BASH_SOURCE%/*}/common.sh"

script=$(basename "$0")

mapfile -t NAMES < repo.list
cmds=()
for NAME in "${NAMES[@]}"; do
    cmds+=("git submodule add git@github.com:mentics-online-ml/'${NAME}'.git '${NAME}'")
done

run_parallel "${script}" "${cmds[@]}"
