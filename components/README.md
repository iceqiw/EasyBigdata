# Init docker

## create network

```
docker network create --driver bridge cluster_net
```

## build images
```
docker compose build
```

## Set install package path

`export INSTALL=<install path>`

example:
```
export INSTALL=~/workspace/EasyBigdata/install
```

# How to setup components

goto the folder of components

Run command as : `docker compose up`