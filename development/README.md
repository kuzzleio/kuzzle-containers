# kuzzleio/development

*~ 780 MB.*  
The development image is useful for plugin or protocol developer.

Contains:
 * all needed to watch and build kuzzleio projects on the fly:
 * NVM with node 6 and node 8
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

### Multi stage

Theses images are build using multi-stage Dockerfile.

The first stage (`development`) is the development image which install packages, grab the source code and build npm packages.  
The second stage (`production`) only copy the application directory and nodejs binaries inside the container.  