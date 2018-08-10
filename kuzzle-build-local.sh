#!/usr/bin/env bash

set -e

for image in core-dev; do
    echo ""
    echo ""
    echo ""
    echo "-------------------------------------------------------------------------------"
    echo "    docker build -t kuzzleio/$image $image"
    echo "-------------------------------------------------------------------------------"
    docker build -t kuzzleio/$image $image
done
