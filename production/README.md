# kuzzleio/production

*~ 250 MB.*  
The production image contain only Kuzzle source code and compiled npm packages.  

### Multi stage

Theses images are build using multi-stage Dockerfile.

The first stage (`development`) is the development image which install packages, grab the source code and build npm packages.  
The second stage (`production`) only copy the application directory and nodejs binaries inside the container.  
