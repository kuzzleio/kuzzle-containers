# Blackfire

This container is used for upload custom logs profiling from [Kuzzle](http://kuzzle.io) to [Blackfire](http://blackfire.io) using [Nodegrind](https://github.com/gwicke/nodegrind)

# How to use

For upload a single file:

```
docker run --rm -ti \
    -e BLACKFIRE_CLIENT_ID=$BLACKFIRE_CLIENT_ID \
    -e BLACKFIRE_CLIENT_TOKEN=$BLACKFIRE_CLIENT_TOKEN \
    -v path/to/file.out:/callgrind.out \
    kuzzleio/blackfire-upload
```

Or for aggregate:

```
docker run --rm -ti \
    -e BLACKFIRE_CLIENT_ID=$BLACKFIRE_CLIENT_ID \
    -e BLACKFIRE_CLIENT_TOKEN=$BLACKFIRE_CLIENT_TOKEN \
    -v path/to/:/profiling \
    kuzzleio/blackfire-upload ./aggregate.sh
```