# kuzzleio/kuzzle

*~ 250 MB.*  
The Kuzzle production image contain only Kuzzle source code and compiled npm packages.  

### Multi stage

Theses images are build using multi-stage Dockerfile.

The first stage (`plugin-dev`) is the development image which install packages, grab the source code and build npm packages.  
The second stage (`kuzzle`) only copy the application directory and nodejs binaries inside the container.  
