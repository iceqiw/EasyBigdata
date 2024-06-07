# How to setup hadoop env with docker?

```
.
└── hadoop
    ├── .env
    ├── Dockerfile-ubuntu-jdk11
    ├── README.md
    ├── docker-compose.yml
    ├── etc
    └── install -> hadoop-3.3.4

```

## prepare files

- hadoop tar [link](https://dlcdn.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz)
- hadoop configuration folder

## create network

```
docker network create --driver bridge cluster_net
```

## Setup and configuration

### setup hadoop cluster
refer to [hadoop](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/ClusterSetup.html)


