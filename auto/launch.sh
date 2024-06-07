#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")/.."

echo `pwd`

docker compose -f ./components/$1/docker-compose.yml run --rm $2 /bin/bash

