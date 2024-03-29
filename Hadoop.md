## 部署节点,添加host(如果只有一个节点，只添加第一列)

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
## 修改代理用户core-site.xml
```
    <property>
        <name>hadoop.proxyuser.xxx.hosts</name>
        <value>*</value>
    </property>
    <property>
        <name>hadoop.proxyuser.xxx.groups</name>
        <value>*</value>
    </property>

```

## HA 配置

**添加 hosts ip hadoop-master2**

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

- 服务端

```xml
    <!--federation-->
    <property>
        <name>yarn.resourcemanager.epoch</name>
        <value>1</value>
    </property>
    <property>
        <name>yarn.federation.enabled</name>
        <value>true</value>
    </property>
    <property>
        <name>yarn.resourcemanager.cluster-id</name>
        <value>cluster1</value>
    </property>
    <property>
        <name>yarn.federation.state-store.class</name>
        <value>org.apache.hadoop.yarn.server.federation.store.impl.ZookeeperFederationStateStore</value>
    </property>
    <property>
        <name>yarn.router.bind-host</name>
        <value>0.0.0.0</value>
    </property>
    <property>
        <name>yarn.router.clientrm.interceptor-class.pipeline</name>
        <value>org.apache.hadoop.yarn.server.router.clientrm.FederationClientInterceptor</value>
    </property>
    <property>
        <name>yarn.nodemanager.amrmproxy.enabled</name>
        <value>true</value>
    </property>
    <property>
        <name>yarn.nodemanager.amrmproxy.interceptor-class.pipeline</name>
        <value>org.apache.hadoop.yarn.server.nodemanager.amrmproxy.FederationInterceptor</value>
    </property>
    <!--federation end-->
```



- 客户端

  ```xml
  <configuration>
      <property>
          <name>yarn.resourcemanager.address</name>
          <value>hadoop-master1:8050</value>
      </property>
      <property>
          <name>yarn.resourcemanager.scheduler.address</name>
          <value>hadoop-master1:8049</value>
      </property>
  </configuration>
  ```

## 安全模式

```shell
#启动命令
hdfs_security_start_all

#客户端命令
hadoop --config etc/hadoop-security  fs -ls /tmp
```



```bash
├── bigdata_env -> /Users/tw/Workspace/bigdata-docker/bigdata_env
├── data
├── etc -> /Users/tw/Workspace/bigdata-docker/etc
├── hadoop
├── hdfs.keytab
├── java -> /Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home
├── keystore.jks
├── krb5.conf
├── logs
├── sbin -> /Users/tw/Workspace/bigdata-docker/sbin
├── truststore.jks
└── zookeeper
```



## Test

` yarn --config etc/hadoop-cli jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.x.x.jar pi 10 10`

