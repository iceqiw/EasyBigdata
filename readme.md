# docker 镜像构建命令e.g

```
docker build -t hd-container:1.0 .
```

## 构建Hadoop运行环境命令e.g

```
docker-compose -f mac-docker-compose-hive.yml up -d
```

## hadoop 常用命令

`hdfs namenode -format`

`hdfs --daemon start namenode`

`hdfs --daemon start datanode`

`yarn --daemon start resourcemanager`

`yarn --daemon start nodemanager`

`hadoop fs -mkdir -p /user/hive/warehouse`

## hive 启动命令

`nohup hiveserver2 &`

`nohup hive --service metastore &
`

## hadoop 集群运行命令

```
1.格式化namenode
hdfs namenode -format

2.启动namenode（主节点）

3.启动datanode （所有节点）

4.初始化hive warehouse目录
hadoop fs -mkdir -p /user/hive/warehouse
hadoop fs -chown hive:hive /user/hive
hadoop fs -chown hive:hive /user/hive/warehouse

5.初始化metastore
schematool -dbType derby -initSchema

# 5 启动hive
nohup hive --service metastore &

nohup hiveserver2 &
```

## hive server2 连接

```
beeline -u jdbc:hive2://localhost:10000/default -n hive

```

## Test

```
create table test(id string, name string, age int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;
```

```
insert into table test values('1','q1',33);
```

```
LOAD DATA INPATH '/tmp/test.txt' INTO TABLE test;
```

2/ 分区关键字 PARTITIONED BY
```sql
create table t_4(ip string,url string,staylong int)
partitioned by (day string)
row format delimited
fields terminated by ',';

```


导入数据到不同的分区目录：
```bash
load data local inpath '/root/weblog.1' into table t_4 partition(day='2017-04-08');
load data local inpath '/root/weblog.2' into table t_4 partition(day='2017-04-09');
```

## mark

- hive on hadoop 3 feature :https://mathsigit.github.io/blog_page/2017/11/16/hole-of-submitting-mr-of-hadoop300RC0/ 

### 善意提醒提高docker container 的内存大小，被坑了好久。

* 构建镜像
    * 下载jdk
    * 修改hd-container配置dockerfile文件,将jdk修改为对应版本
    * 运行构建命令 docker build -t hd-container:1.0 .
* 构建集群容器
    * 下载hadoop tar.gz包,hive tar.gz包
    * 修改 docker-compose yml文件为对应版本,修改对应的配置文件存放路径
    * 启动集群 docker-compose -f mac-docker-compose-hive.yml up -d
    * 测试容器docker exec -it c46d734303b9 /bin/bash
