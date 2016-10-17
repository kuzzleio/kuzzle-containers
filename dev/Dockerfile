FROM kuzzleio/base
MAINTAINER Kuzzle <support@kuzzle.io>

COPY profile /tmp/profile

WORKDIR /var/app

RUN apt-get update && apt-get install -y \
      bash-completion \
      build-essential \
      curl \
      g++ \
      git \
      libfontconfig \
      python \
      rbenv \
      wget \
    && gem install \
      sass --version 3.2.10 \
    && npm install -g \
      bower \
      node-inspector \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && alias ll="ls -lahF --color"

ENV TERM=xterm-256color
