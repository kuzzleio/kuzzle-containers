#!/bin/sh
# This script must be call only by a container running in travis (because of coveralls)
set -e

npm install

grunt

echo "Starting Kuzzle BO..."
pm2 start /config/processes.json

npm test
npm run coveralls