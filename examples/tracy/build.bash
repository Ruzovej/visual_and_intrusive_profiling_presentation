#!/usr/bin/env bash

set -e

(
    set -x
    cmake \
        -B build \
        -S . \
        -DCMAKE_BUILD_TYPE=Release
)

(
    set -x
    cmake \
        --build build \
        -j "$(nproc)"
)
