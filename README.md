# kuzzle-containers

This repository contains mutualized containers for running [Kuzzle](https://github.com/kuzzleio/kuzzle) stack.

It contains :
 * [kuzzleio/core-dev](https://hub.docker.com/r/kuzzleio/core-dev/) image: used by core developer to develop on the Kuzzle core
 * [kuzzleio/plugin-dev](https://hub.docker.com/r/kuzzleio/plugin-dev/) image: used by plugin or protocol developer
 * [kuzzleio/production](https://hub.docker.com/r/kuzzleio/production/) image: used to deploy Kuzzle in production

## kuzzleio/core-dev

*~ 720 MB.*  
This image is useful for core developer. Kuzzle source code is mounted inside the container allowing pm2 to reload Kuzzle when the code change.

Contains:
 * all needed to watch and build kuzzleio projects on the fly:
 * [n](https://github.com/tj/n) with node 6 and node 8
  * build-essential
  * g++
  * python
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

## kuzzleio/plugin-dev

*~ 780 MB.*  
The plugin-dev image is useful for plugin or protocol developer.

 Contains:
  * all needed to watch and build kuzzleio projects on the fly:
  * [n](https://github.com/tj/n) with node 6 and node 8
   * build-essential
   * g++
   * python
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

## kuzzleio/kuzzle

*~ 250 MB.*  
The Kuzzle production image contains only Kuzzle source code and compiled npm packages.  
