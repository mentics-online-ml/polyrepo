#!/usr/bin/env bash
. "${BASH_SOURCE%/*}/common.sh"
submodule_foreach_parallel "git status --porcelain"
