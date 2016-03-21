#!/usr/bin/env bash

set -e

for image in base dev bo-base bo-test bo-dev elasticsearch rabbitmq; do
    echo ""
    echo ""
    echo ""
    echo "-------------------------------------------------------------------------------"
    echo "    docker build -t kuzzleio/$image $image"
    echo "-------------------------------------------------------------------------------"
    docker build -t kuzzleio/$image $image
done
docker build -t kuzzleio/kuzzle dev
docker build -t kuzzleio/bo bo-base
