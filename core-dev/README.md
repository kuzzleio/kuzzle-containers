# kuzzleio/core-dev

*~ 720 MB.*  
This image is useful for core developer. Kuzzle source code is mounted inside the container allowing pm2 to reload Kuzzle when the code change.

Contains:
 * all needed to watch and build kuzzleio projects on the fly:
 * NVM with node 12
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
