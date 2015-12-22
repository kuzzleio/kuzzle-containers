#!/bin/sh
set -e

echo "Starting Kuzzle BO..."
pm2 start /config/processes.json

npm install
grunt sass
bower install

npm test