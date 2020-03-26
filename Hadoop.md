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

## HA 配置

- 添加 hosts ip hadoop-master2

- 添加配置

  ```xml
  <property>
          <name>yarn.resourcemanager.ha.enabled</name>
          <value>true</value>
      </property>
      <property>
          <name>yarn.resourcemanager.cluster-id</name>
          <value>cluster1</value>
      </property>
      <property>
          <name>yarn.resourcemanager.ha.rm-ids</name>
          <value>rm1,rm2</value>
      </property>
      <property>
          <name>yarn.resourcemanager.hostname.rm1</name>
          <value>hadoop-master1</value>
      </property>
      <property>
          <name>yarn.resourcemanager.hostname.rm2</name>
          <value>hadoop-master2</value>
      </property>
      <property>
          <name>yarn.resourcemanager.webapp.address.rm1</name>
          <value>hadoop-master1:8088</value>
      </property>
      <property>
          <name>yarn.resourcemanager.webapp.address.rm2</name>
          <value>hadoop-master2:8088</value>
      </property>
      <property>
          <name>hadoop.zk.address</name>
          <value>hadoop-master1:2181</value>
      </property>
  ```

  

## Federation 配置





## Test

` yarn --config etc/hadoop-cli jar hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.3.jar pi 10 10`