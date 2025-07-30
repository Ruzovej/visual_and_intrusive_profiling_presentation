#!/usr/bin/env bash

set -e

source "$(dirname "$0")/docker_common.bash"

(
    cd_to_root_of_this_repo
    
    USER_ID="$(id -u)"
    GROUP_ID="$(id -g)"
    USER_NAME="$(id -un)"
    GROUP_NAME="$(id -gn)"

    set -x
    docker build \
        --build-arg USER_ID="${USER_ID}" \
        --build-arg GROUP_ID="${GROUP_ID}" \
        --build-arg USER_NAME="${USER_NAME}" \
        --build-arg GROUP_NAME="${GROUP_NAME}" \
        --file docker/Dockerfile \
        --tag "${IMAGE_NAME}" \
        docker
)
