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

## hive 启动命令

`nohup hiveserver2 &`

`nohup hive --service metastore &
`

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
hadoop fs -chown hive:hive /user/hive/warehouse
schematool -dbType derby -initSchema

```

## hive server2 连接

```
beeline -u jdbc:hive2://localhost:10000/default -n hive
```

## Test

```sql

create table test(id string, name string, age int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;
insert into table test values('1','q1',33);
LOAD DATA INPATH '/tmp/test.txt' INTO TABLE test;
```


## mark

- hive on hadoop 3 feature :https://mathsigit.github.io/blog_page/2017/11/16/hole-of-submitting-mr-of-hadoop300RC0/ 

### 善意提醒提高docker container 的内存大小，被坑了好久。
