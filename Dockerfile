FROM alpine:edge
MAINTAINER vimtry
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
    curl \
    gcc \
    git \
    linux-headers \
    musl-dev\
    vim \
    neovim \
    python-dev \
    py-pip \
    python3-dev \
    py3-pip && \
    rm -rf /var/cache/apk/*

ENV LANG="ja_JP.UTF-8" LANGUAGE="ja_JP:ja" LC_ALL="ja_JP.UTF-8"
RUN pip3 install --upgrade pip neovim pynvim && \
    rm -rf /root/.cache

RUN mkdir -p /root/.config/nvim
COPY init.vim /root/.config/nvim
WORKDIR /root

ENTRYPOINT ["nvim"]
