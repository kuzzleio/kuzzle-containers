#/bin/bash

echo -e "\nPush kuzzleio/core-dev image...\n"
docker push kuzzleio/core-dev

echo -e "\nPush kuzzleio/development image...\n"
docker push kuzzleio/development

echo -e "\nPush kuzzleio/production image...\n"
docker push kuzzleio/production
