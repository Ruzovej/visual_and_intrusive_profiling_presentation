FROM debian:bookworm

RUN apt update \
    && apt install -y  \
        git \
        make \
        less \
        texlive \
        texlive-fonts-recommended \
        texlive-lang-english \
        texlive-luatex \
        texlive-pictures \
        texlive-xetex \
        vim \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=C.UTF-8

ARG USER_ID
ARG GROUP_ID
ARG USER_NAME
ARG GROUP_NAME

RUN groupadd \
        --gid "${GROUP_ID:?}" \
        "${GROUP_NAME:?}" \
    && useradd \
        --uid "${USER_ID:?}" \
        --gid "${GROUP_ID:?}" \
        --no-create-home \
        --shell /bin/bash \
        "${USER_NAME:?}"
