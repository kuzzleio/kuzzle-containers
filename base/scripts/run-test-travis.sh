#!/bin/sh
# This script must be call only by a container running in travis (because of codecov)
set -e

npm install

while ! curl -silent -output /dev/null http://elasticsearch:9200 > /dev/null
do
  echo "$(date) - still trying connecting to http://elasticsearch:9200"
  sleep 1
done
echo "$(date) - connected successfully to ElasticSearch"

node bin/kuzzle install && pm2 start /config/processes-dev.json --silent && npm test
npm run codecov
