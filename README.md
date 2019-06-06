# kuzzle-containers

This repository contains mutualized containers for running [Kuzzle](https://github.com/kuzzleio/kuzzle) stack.

It contains :
 * [kuzzleio/core-dev](https://hub.docker.com/r/kuzzleio/core-dev/) image: used by core developer to develop on the Kuzzle core

## Prerequisites

ARM based rootfs are tracked using [git LFS storage](https://git-lfs.github.com/).

Make sure to install git lfs and enable it for the repository.

## kuzzleio/core-dev

*~ 720 MB.*  
This image is useful for core developer. Kuzzle source code is mounted inside the container allowing pm2 to reload Kuzzle when the code change.

Contains:
 * all needed to watch and build kuzzleio projects on the fly:
 * [n](https://github.com/tj/n) with node 6 and node 8
  * build-essential
  * g++
  * python
  * procps
  * rbenv
  * libfontconfig
  * [gem] sass
  * [npm] bower
  * [npm] node-inspector
 * tools to improve development experience:
  * bash-completion
  * ll alias
  * curl
  * wget
