# kuzzle-containers

This repository contains mutualized containers for running [Kuzzle](https://github.com/kuzzleio/kuzzle) stack.

It contains :
 * [kuzzleio/base](https://hub.docker.com/r/kuzzleio/base/) image: used to build kuzzleio projects in production mode
 * [kuzzleio/dev](https://hub.docker.com/r/kuzzleio/dev/) image: used to run kuzzleio projects in development mode

## kuzzleio/base

Contains nodejs (4.5.0) binary and pm2 global module

## kuzzleio/dev

Based on kuzzleio/base

Contains:
 * all needed to watch and build kuzzleio projects on the fly:
  * build-essential
  * g++
  * python
  * rbenv
  * libfontconfig
  * [gem] sass
  * [npm] bower
  * [npm] node-inspector
 * tools to improve development experience:
  * vim (+ profile)
  * zsh (+ ohmyzsh)
  * bash-completion
  * curl
  * wget
