# Init docker

## create network

```
docker network create --driver bridge cluster_net
```

## build images
```
docker compose build
```

## Set install package dir

```
export INSTALL=~/workspace/EasyBigdata/install
```
