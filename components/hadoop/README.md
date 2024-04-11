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

### dockerfile

``` dockerfile
# Create a Docker image that is ready to run the main Checker Framework tests,
# using JDK 11.

# "ubuntu" is the latest LTS release.  "ubuntu:rolling" is the latest release.
FROM ubuntu
MAINTAINER Michael Ernst <mernst@cs.washington.edu>

# According to
# https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/:
#  * Put "apt-get update" and "apt-get install" and "apt cleanup" in the same RUN command.
#  * Do not run "apt-get upgrade"; instead get upstream to update.

RUN export DEBIAN_FRONTEND=noninteractive \
&& apt-get -qqy update \
&& apt-get -y install aptitude \
&& aptitude -y install \
  apt-utils

RUN export DEBIAN_FRONTEND=noninteractive \
&& apt-get -qqy update \
&& aptitude -y install \
  openjdk-11-jdk \
  openjdk-17-jdk \
&& update-java-alternatives -s java-1.11.0-openjdk-amd64

# Known good combinations of JTReg and the JDK appear at https://builds.shipilev.net/jtreg/ .

RUN export DEBIAN_FRONTEND=noninteractive \
&& apt-get -qqy update \
&& aptitude -y install \
  ant \
  cpp \
  git \
  jq \
  jtreg6 \
  libcurl3-gnutls \
  make \
  maven \
  net-tools \
  python3-distutils \
  python3-requests \
  unzip \
  wget

RUN export DEBIAN_FRONTEND=noninteractive \
&& apt-get autoremove \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

ARG USERNAME=ice
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Create the user
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME
    # ********************************************************
# * Anything else you want to do like clean up goes here *
# ********************************************************

RUN mkdir -p /opt/bigdata
RUN chown -R $USERNAME: /opt/bigdata
# [Optional] Set the default user. Omit if you want to keep the default as root.
USER $USERNAME

# set java environment variables
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
ENV CLASSPATH .:${JAVA_HOME}/lib
```

### env file

```sh
BIGDATA_HOME=/opt/bigdata
BIGDATA_CONF=$BIGDATA_HOME/etc
BIGDATA_LOG=$BIGDATA_HOME/logs
HADOOP_HOME=$BIGDATA_HOME/hadoop

PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

HADOOP_CONF_DIR=$BIGDATA_CONF/hadoop
HADOOP_LOG_DIR=$BIGDATA_LOG/hadoop
YARN_CONF_DIR=$BIGDATA_CONF/hadoop
YARN_LOG_DIR=$BIGDATA_LOG/hadoop
```

### docker-compose

```
version: '3'
services:
  master01:
    image: base-data:1.0
    build:
      context: .
      dockerfile: Dockerfile-ubuntu-jdk11
    working_dir: /opt/bigdata
    hostname: master01
    volumes:
      - ./hadoop-3.3.6:/opt/bigdata/hadoop
      - ./etc/hadoop:/opt/bigdata/etc/hadoop
      - ./script:/opt/bigdata/script
    networks:
      - cluster_net
    ports:
      - "50070:50070"
      - "8088:8088"
    env_file:
      - .env
        #entrypoint: ["bash","/opt/bigdata/script/nn.sh"]
  slave01:
    image: base-data:1.0
    build:
      context: .
      dockerfile: Dockerfile-ubuntu-jdk11
    working_dir: /opt/bigdata
    hostname: slave01
    volumes:
      - ./hadoop-3.3.6:/opt/bigdata/hadoop
      - ./etc/hadoop:/opt/bigdata/etc/hadoop
    networks:
      - cluster_net
    env_file:
      - .env

networks:
  cluster_net:
    external: true
```

### setup hadoop cluster
refer to [hadoop](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-common/ClusterSetup.html)

## Run command

`docker-compose run --service-ports master01 /bin/bash`

