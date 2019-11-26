
## 部署


| hadoop-master1 | hadoop-slave1 | hadoop-slave2 |
|:--------------:|:-------------:|:-------------:|
| zk1（myid=>1)  | zk2（myid=>2) | zk3（myid=>3) |
| kafka broker1  | kafka broker2 | kafka broker3 |


## 初始化

```
# 1.初始化目录 所有节点
mkdir -p /opt/bigdata/data/zookeeper
# 2.指定zk myid
echo 1 > /opt/bigdata/data/zookeeper/myid 
echo 2 > /opt/bigdata/data/zookeeper/myid 
echo 3 > /opt/bigdata/data/zookeeper/myid 
```
## 启动
```
# 1 start zk 所有节点
zkServer.sh start

# 2 start kafka
kafka-server-start.sh -daemon /opt/bigdata/etc/kafka/server-1.properties
kafka-server-start.sh -daemon /opt/bigdata/etc/kafka/server-2.properties
kafka-server-start.sh -daemon /opt/bigdata/etc/kafka/server-3.properties

#3 start kafak manager
nohup bin/kafka-manager -Dconfig.file=conf/application.conf &
```
## 备注

kafka manager 没有单独配置文件，使用安装目录下的配置文件