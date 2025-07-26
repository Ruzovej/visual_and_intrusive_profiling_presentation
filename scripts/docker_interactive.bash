#!/usr/bin/env bash

set -e

source "$(dirname "$0")/docker_common.bash"

run_in_texlive_container \
    --interactive \
    --tty \
    /bin/bash
