FROM kuzzleio/elasticsearch
MAINTAINER kuzzle <support@kuzzle.io>

CMD sysctl -w vm.max_map_count=300000

RUN /usr/share/elasticsearch/bin/es-docker
