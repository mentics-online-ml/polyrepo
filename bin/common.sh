#!/usr/bin/env bash

# Functions and such to be used by other scripts

function run_parallel() {
    local args=("$@")
    if [ ${#args[@]} -lt 2 ]; then
        echo "Requires args: name commands"
        return
    fi
    local name=${args[0]}

    local outdir="/tmp/del/$name"
    mkdir -p "${outdir}"
    for ((i=1; i < ${#args[@]}; i++)); do
        cmd=${args[$i]}
        echo "Running $cmd"
        eval "$cmd" > "${outdir}/${i}".log 2>&1 &
    done
    wait
    echo "Done"

    for ((i=1; i < ${#args[@]}; i++)); do
        cat "${outdir}/${i}".log
    done

    rm -rf "${outdir}"
}