#!/bin/sh
set -e

grunt

echo "Starting Kuzzle BO..."
pm2 start /config/processes.json

grunt sass
bower install

npm test