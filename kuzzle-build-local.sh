#!/usr/bin/env bash

echo "Now, we can build our containers"
for image in base dev bo-base bo-test; do
    echo docker build -t kuzzleio/$image $image
    docker build -t kuzzleio/$image $image
done
docker build -t kuzzleio/kuzzle dev
