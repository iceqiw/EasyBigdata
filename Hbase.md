## mark

- hive on hadoop 3 feature :https://mathsigit.github.io/blog_page/2017/11/16/hole-of-submitting-mr-of-hadoop300RC0/ 

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
# 3 启动hive meatstore
nohup hive --service metastore &

# 4 启动hive meatstore
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