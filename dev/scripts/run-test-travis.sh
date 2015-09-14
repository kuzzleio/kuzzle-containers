#!/bin/sh
# This script must be call only by a container running in travis (because of coveralls)
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

grunt jshint
pm2 start /config/processes-dev.json
npm test
npm run coveralls