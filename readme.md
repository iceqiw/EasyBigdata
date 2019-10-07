# docker 镜像构建

```
docker build -t hd-container:1.0 .
```

## 构建Hadoop运行环境

```
# win
docker-compose -f win-docker-compose-hive.yml up -d

#mac
docker-compose -f mac-docker-compose-hive.yml up -d
```

## hadoop 启动命令

`hdfs namenode -format`

`hadoop-daemon.sh start namenode`

`hadoop-daemon.sh start datanode`

`yarn-daemon.sh start resourcemanager`

`yarn-daemon.sh start nodemanager`

`hadoop fs -mkdir -p /user/hive/warehouse`

## hadoop 启动命令

`./hiveserver2 &`

## hadoop 集群运行命令

```
# 1 初始化环境 
source /opt/script/bigdata_env.sh
# 2 启动master
hdfs namenode -format
sh /opt/script/start-components.sh master
# 3 启动slave
sh /opt/script/start-components.sh slave
# 4 初始化hive
hadoop fs -mkdir -p /user/hive/warehouse
hadoop fs -chown hive:hive /user/hive
# 5启动hiveserver2
```

## hive server2 连接

```
beeline -u jdbc:hive2://localhost:10000/default -n scott -p sssss
```

