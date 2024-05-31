## 部署

参考 Hadoop，kafka 部署，启动 hadoop，zk

|        bd-master-1         | hadoop-slave1 | hadoop-slave2 |
| :------------------------: | :-----------: | :-----------: |
|     namenode,datanode      |   datanode    |   datanode    |
| resoursemanager,nodemanger |  nodemanger   |  nodemanger   |
|    HMaster,regionserver    | regionserver  | regionserver  |
|             zk             |      zk       |      zk       |

## 初始化

```
none
```

## 启动

```
#1 start hmaster (master node)
hbase-daemon.sh start master

#2 start regionserver (all node)
hbase-daemon.sh start regionserver

hbase-daemon.sh start zookeeper
```

