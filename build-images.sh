#/bin/bash

echo -e "\nBuild kuzzleio/core-dev image...\n"
docker build -t kuzzleio/core-dev core-dev/

echo -e "\nBuild kuzzleio/development image...\n"
docker build --target development -t kuzzleio/development kuzzle/

echo -e "\nBuild kuzzleio/production image...\n"
docker build -t kuzzleio/production kuzzle/
