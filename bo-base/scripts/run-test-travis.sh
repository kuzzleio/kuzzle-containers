#!/bin/sh
# This script must be call only by a container running in travis (because of coveralls)
set -e

grunt

echo "Starting Kuzzle BO..."
pm2 start /config/processes.json

grunt sass

npm test
npm run coveralls