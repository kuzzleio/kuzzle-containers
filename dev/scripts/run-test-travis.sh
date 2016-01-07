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

while ! nmap -p 1883 rabbit
do
  echo "$(date) - still trying connecting to http://rabbit:1883"
  sleep 1
done
echo "$(date) - connected successfully to RabbitMQ"

echo "Starting Kuzzle..."

grunt
pm2 start /config/processes-dev.json
npm run unit-testing --coverage

while ! curl -silent -output /dev/null http://localhost:7511 > /dev/null
do
  echo "$(date) - still trying connecting to Kuzzle Server"
  sleep 1
done
echo "$(date) - connected successfully to Kuzzle Server"

npm run functional-testing

npm run codecov
