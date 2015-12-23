#!/bin/sh
set -e

npm install
grunt sass
bower install --allow-root --config.interactive=false

echo "Starting Kuzzle BO..."
pm2 start /config/processes.json

npm test