#!/bin/sh
set -e

npm install

while ! curl -silent -output /dev/null http://elasticsearch:9200 > /dev/null
do
  echo "$(date) - still trying connecting to http://elasticsearch:9200"
  sleep 1
done
echo "$(date) - connected successfully to ElasticSearch"

echo "Starting Kuzzle..."

node bin/kuzzle install && pm2 start /config/processes-dev.json && npm test
