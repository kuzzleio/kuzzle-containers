# kuzzleio/kuzzle

*~ 250 MB.*  
The Kuzzle production image contain only Kuzzle source code and compiled npm packages.  

### Multi stage

Theses images are build using multi-stage Dockerfile.

The first stage (`plugin-dev`) is the development image which installs packages, grabs the source code and builds npm packages.  
The second stage (`kuzzle`) only copies the application directory and nodejs binaries inside the container.  
