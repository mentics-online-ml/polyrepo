#!/usr/bin/env bash
set -e

. "${BASH_SOURCE%/*}/common.sh"

submodule_foreach_parallel "git add ."
submodule_foreach_parallel "test -z \"\$(git status --porcelain)\" || git commit -m '$1'"
submodule_foreach_parallel "git push"
