#!/bin/bash
echo "deploy cluster...."
docker-compose -f docker/docker-compose-hadoop.yml up -d
echo "finish deploy cluster"

echo "login"

docker exec -it -u doper docker_bd-master_1 /bin/bash
