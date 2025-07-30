#!/usr/bin/env bash

set -e

if ! command -v docker &> /dev/null; then
    printf 'Error: Docker is not installed or not in PATH\n' >&2
    exit 1
fi

export IMAGE_NAME_BASE="texlive_compiler"
export IMAGE_NAME="${IMAGE_NAME_BASE}:latest"

function cd_to_root_of_this_repo() {
    while [[ ! -d .git ]]; do
        if [[ "${PWD}" == "/" ]]; then
            printf 'Error: Not inside a git repository\n' >&2
            exit 1
        fi
        cd ..
    done
}

function run_in_texlive_container() {
    local USER_ID="$(id -u)"
    local GROUP_ID="$(id -g)"

    local docker_run_args=()
    local tail_args=()

    while (( $# > 0 )); do
        case "$1" in
            --interactive|-i)
                docker_run_args+=("--interactive")
                ;;
            --tty|-t)
                docker_run_args+=("--tty")
                ;;
            *)
                tail_args+=("$1")
                ;;
        esac
        shift
    done

    (
        cd_to_root_of_this_repo

        set -x
        docker run \
            --rm \
            --user "${USER_ID}:${GROUP_ID}" \
            --volume "${PWD}:${PWD}" \
            --workdir "${PWD}" \
            --hostname "${IMAGE_NAME_BASE}" \
            "${docker_run_args[@]}" \
            "${IMAGE_NAME}" \
            "${tail_args[@]}"
    )
}
