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

## 部署节点

|       hadoop-master1       | hadoop-slave1 | hadoop-slave2 |
|:--------------------------:|:-------------:|:-------------:|
|     namenode,datanode      |   datanode    |   datanode    |
| resoursemanager,nodemanger |  nodemanger   |  nodemanger   |

## hadoop 启动命令

`hdfs namenode -format` 格式化namenode

`hdfs --daemon start namenode` 启动namenode

`hdfs --daemon start datanode` 启动datanode

`yarn --daemon start resourcemanager` 启动resourcemanager

`yarn --daemon start nodemanager` 启动nodemanager

## 流程：

 1.格式化namenode
 
 2.启动namenode,resourcemanager（主节点）
 
 3.启动datanode,nodemanager（所有节点）
 

## 初始化 hadoop 

```
hdfs namenode -format
```
## 启动hadoop 集群
```
hdfs --daemon start namenode
yarn --daemon start resourcemanager

hdfs --daemon start datanode
yarn --daemon start nodemanager
```

### 善意提醒提高docker container 的内存大小，被坑了好久。
