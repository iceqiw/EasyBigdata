# docker 镜像构建命令e.g

```
docker build -t hd-container:1.0 .
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

### 善意提醒提高docker container 的内存大小，被坑了好久。
