#!/bin/sh
set -e

grunt

echo "Starting Kuzzle BO..."
pm2 start /config/processes.json

npm test