#!/usr/bin/env bash

echo "Now, we can build our containers"
for image in base dev bo-base bo-test; do
    docker build -t kuzzleio/$image $image
done
docker build -t kuzzleio/kuzzle kuzzleio/dev
