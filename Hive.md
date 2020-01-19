## mark


- hive on hadoop 3 feature :https://mathsigit.github.io/blog_page/2017/11/16/hole-of-submitting-mr-of-hadoop300RC0/ 


## 部署节点
依赖于hadoop 服务

|       hadoop-master1       | hadoop-slave1 | hadoop-slave2 |
|:--------------------------:|:-------------:|:-------------:|
|     namenode,datanode      |   datanode    |   datanode    |
| resoursemanager,nodemanger |  nodemanger   |  nodemanger   |
|   hiveserver2,metastore    |               |               |


## 初始化 hive

```
# 1.初始化hive warehouse目录
hadoop fs -mkdir -p /user/hive/warehouse
hadoop fs -chown hive:hive /user/hive
hadoop fs -chown hive:hive /user/hive/warehouse

# 2.初始化metastore
schematool -dbType derby -initSchema
```
## 启动hive
```
# 3 启动hive metastore
nohup hive --service metastore &

# 4 启动hive server
nohup hiveserver2 &
```

## Hive 

`hive --hiveconf log4j.configurationFile=/opt/bigdata/etc/hive/hive-log4j.properties`

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

## Hive log 日志问题

- 源码中hive 读取的是log4j2

- 配置中需要按log4j2配置

  ```properties
  # Licensed to the Apache Software Foundation (ASF) under one
  # or more contributor license agreements.  See the NOTICE file
  # distributed with this work for additional information
  # regarding copyright ownership.  The ASF licenses this file
  # to you under the Apache License, Version 2.0 (the
  # "License"); you may not use this file except in compliance
  # with the License.  You may obtain a copy of the License at
  #
  #     http://www.apache.org/licenses/LICENSE-2.0
  #
  # Unless required by applicable law or agreed to in writing, software
  # distributed under the License is distributed on an "AS IS" BASIS,
  # WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  # See the License for the specific language governing permissions and
  # limitations under the License.
  
  status = INFO
  name = HiveLog4j2
  packages = org.apache.hadoop.hive.ql.log
  
  # list of properties
  property.hive.log.level = INFO
  property.hive.root.logger = DRFA
  property.hive.log.dir = ${sys:java.io.tmpdir}/${sys:user.name}
  property.hive.log.file = hive.log
  property.hive.perflogger.log.level = INFO
  
  # list of all appenders
  appenders = console, DRFA
  
  # console appender
  appender.console.type = Console
  appender.console.name = console
  appender.console.target = SYSTEM_ERR
  appender.console.layout.type = PatternLayout
  appender.console.layout.pattern = %d{ISO8601} %5p [%t] %c{2}: %m%n
  
  # daily rolling file appender
  appender.DRFA.type = RollingRandomAccessFile
  appender.DRFA.name = DRFA
  appender.DRFA.fileName = ${sys:hive.log.dir}/${sys:hive.log.file}
  # Use %pid in the filePattern to append <process-id>@<host-name> to the filename if you want separate log files for different CLI session
  appender.DRFA.filePattern = ${sys:hive.log.dir}/${sys:hive.log.file}.%d{yyyy-MM-dd}
  appender.DRFA.layout.type = PatternLayout
  appender.DRFA.layout.pattern = %d{ISO8601} %5p [%t] %c{2}: %m%n
  appender.DRFA.policies.type = Policies
  appender.DRFA.policies.time.type = TimeBasedTriggeringPolicy
  appender.DRFA.policies.time.interval = 1
  appender.DRFA.policies.time.modulate = true
  appender.DRFA.strategy.type = DefaultRolloverStrategy
  appender.DRFA.strategy.max = 30
  
  # list of all loggers
  loggers = NIOServerCnxn, ClientCnxnSocketNIO, DataNucleus, Datastore, JPOX, PerfLogger, AmazonAws, ApacheHttp
  
  logger.NIOServerCnxn.name = org.apache.zookeeper.server.NIOServerCnxn
  logger.NIOServerCnxn.level = WARN
  
  logger.ClientCnxnSocketNIO.name = org.apache.zookeeper.ClientCnxnSocketNIO
  logger.ClientCnxnSocketNIO.level = WARN
  
  logger.DataNucleus.name = DataNucleus
  logger.DataNucleus.level = ERROR
  
  logger.Datastore.name = Datastore
  logger.Datastore.level = ERROR
  
  logger.JPOX.name = JPOX
  logger.JPOX.level = ERROR
  
  logger.AmazonAws.name=com.amazonaws
  logger.AmazonAws.level = INFO
  
  logger.ApacheHttp.name=org.apache.http
  logger.ApacheHttp.level = INFO
  
  logger.PerfLogger.name = org.apache.hadoop.hive.ql.log.PerfLogger
  logger.PerfLogger.level = ${sys:hive.perflogger.log.level}
  
  # root logger
  rootLogger.level = ${sys:hive.log.level}
  rootLogger.appenderRefs = root
  rootLogger.appenderRef.root.ref = ${sys:hive.root.logger}
  
  ```

  