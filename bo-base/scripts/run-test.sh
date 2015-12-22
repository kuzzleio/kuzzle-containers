#!/bin/sh
set -e

echo "Starting Kuzzle BO..."
pm2 start /config/processes.json

grunt sass
bower install

npm test