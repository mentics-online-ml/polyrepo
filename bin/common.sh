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
        # echo "Running $cmd"
        eval "$cmd" > "${outdir}/${i}".log 2>&1 &
    done
    wait
    echo "Done"

    for ((i=1; i < ${#args[@]}; i++)); do
        cat "${outdir}/${i}".log
    done

    # TODO: test outdir is safe?
    rm -rf "${outdir}"
}

function submodule_foreach_parallel() {
    cmd=$1
    if [ -z "$cmd" ]; then
        echo "Requires arg: command to run in each submodule"
        return
    fi

    mapfile -t paths <<< "$(git submodule foreach --recursive -q sh -c pwd)"
    cmds=()
    for path in "${paths[@]}"; do
        cmds+=("cd $path && $cmd")
    done
    run_parallel 'submodule_foreach_parallel' "${cmds[@]}"

    # local outdir="/tmp/del/submodule-foreach"
    # mkdir -p "${outdir}"

    # git submodule foreach "$cmd > \"${outdir}/\${PWD##*/}\" 2>&1 &" > /dev/null
    # wait
    # echo "done waiting"

    # for path in "${outdir}"/*; do
    #     file="${path##*/}"
    #     echo "-- ${file} --"
    #     cat "${outdir}/${file}"
    # done

    # # TODO: rm -rf "${outdir}"
}
