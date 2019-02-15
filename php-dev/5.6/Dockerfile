FROM php:5.6-cli

LABEL io.kuzzle.vendor="Kuzzle <support@kuzzle.io>"

WORKDIR /var/app
ENV TERM=xterm

RUN set -x \
  \
  && apt-get update && apt-get install -y \
        bash-completion \
        curl \
        git \
        libfontconfig \
        wget \
        zip \
        unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "alias ll=\"ls -lahF --color\"" >> ~/.bashrc
