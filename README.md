### 善意提醒提高docker container 的内存大小，被坑了好久。

# docker 镜像构建命令e.g

```
docker build -t hd-container:1.0 .
```

## 修改yml文件中的挂载目录e.g

```
volumes:
      - ~/bigdata/hadoop:/opt/bigdata/hadoop
      - ./etc/hadoop:/opt/bigdata/etc/hadoop
      - ./env/bigdata_env.sh:/etc/profile.d/bigdata_env.sh

# ~/bigdata/hadoop 为本地hadoop安装目录
```


## 构建集群运行环境命令e.g

```
docker-compose -f mac-docker-compose-hadoop.yml up -d
```
## 修改环境变量bigdata-docker/build-env/env/bigdata_env.sh

```
export BIGDATAHOME=/opt/bigdata 为安装目录

```
## 部署参考

Hadoop : Hadoop.md

HBase: HBase.md

Hive: Hive.md

Kafka: Kafka.md

