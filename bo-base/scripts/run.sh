#!/bin/sh

npm install

echo "Starting Kuzzle BO..."
pm2 start /config/processes.json

pm2 logs