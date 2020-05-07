# 解压安装包

# 配置环境变量

```bash
#!/bin/bash
export BIGDATAHOME=/opt/bigdata
export BIGDATA_CONF=$BIGDATAHOME/etc
export BIGDATA_LOG=$BIGDATAHOME/logs
export JAVA_HOME=$BIGDATAHOME/java
export PATH=$JAVA_HOME/bin:$PATH

if [[ -d "$BIGDATAHOME/hadoop" ]]; then
  export HADOOP_HOME=$BIGDATAHOME/hadoop
  source $BIGDATAHOME/sbin/hadoop.sh
fi

if [[ -d "$BIGDATAHOME/hive" ]]; then
  export HIVE_HOME=$BIGDATAHOME/hive
  source $BIGDATAHOME/sbin/hive.sh
fi

if [[ -d "$BIGDATAHOME/tez" ]]; then
  export TEZ_CONF_DIR=$BIGDATA_CONF/tez
  export TEZ_JARS=$BIGDATAHOME/tez
  export HADOOP_CLASSPATH=${TEZ_CONF_DIR}:${TEZ_JARS}/*:${TEZ_JARS}/lib/*
fi

if [[ -d "$BIGDATAHOME/zookeeper" ]]; then
  export ZOO_HOME=$BIGDATAHOME/zookeeper
  source $BIGDATAHOME/sbin/zookeeper.sh
fi

if [[ -d "$BIGDATAHOME/hbase" ]]; then
  export HBASE_HOME=$BIGDATAHOME/hbase
fi

if [[ -d "$BIGDATAHOME/kafka" ]]; then
  export KAFKA_HOME=$BIGDATAHOME/kafka
fi

if [[ -d "$BIGDATAHOME/kafka-manager" ]]; then
  export KAFKA_MANAGER_HOME=$BIGDATAHOME/kafka-manager
fi

if [[ -n $HADOOP_HOME ]]; then
  export PATH=$HADOOP_HOME/bin:$PATH
  export PATH=$HADOOP_HOME/sbin:$PATH

  export HADOOP_CONF_DIR=$BIGDATA_CONF/hadoop
  export HADOOP_LOG_DIR=$BIGDATA_LOG/hadoop
fi

if [[ -n $HIVE_HOME ]]; then
  export PATH=$HIVE_HOME/bin:$PATH
  export HIVE_CONF_DIR=$BIGDATA_CONF/hive
fi

if [[ -n $ZOO_HOME ]]; then
  export PATH=$ZOO_HOME/bin:$PATH
  export ZOOCFGDIR=$BIGDATA_CONF/zookeeper
fi

if [[ -n $KAFKA_HOME ]]; then
  export PATH=$KAFKA_HOME/bin:$PATH
  export PATH=$KAFKA_MANAGER_HOME/bin:$PATH
fi

if [[ -n $HBASE_HOME ]]; then
  export PATH=$HBASE_HOME/bin:$PATH
  export PATH=$HBASE_HOME/sbin:$PATH
  export HBASE_CONF_DIR=$BIGDATA_CONF/hbase
  export HBASE_LOG_DIR=$BIGDATA_LOG/hbase
fi

```



# 创建软连接

`ln -s /user/wei/doekcer/etc etc`

```bash
# /opt/bigdata

├── bigdata_env -> /home/qiwei/workspace/bigdata-docker/bigdata_env
├── etc -> /home/qiwei/workspace/bigdata-docker/etc
├── hadoop
├── java -> /Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home
└── sbin -> /home/qiwei/workspace/bigdata-docker/sbin
```



### E.g:链接hadoop(hive,spark) 配置

```
├── alluxio
├── alluxio-cli
├── hadoop -> /Users/tw/workspace/bigdata-docker/etc/hadoop-security
├── hadoop-cli
├── hadoop-default
├── hadoop-for-nm
├── hadoop-ha
├── hadoop-security
├── hadoop-security-cli
├── hbase
├── hive
├── kafka
├── kerberos
├── tez
├── zeppelin
└── zookeeper
```



## 初始化

- 环境变量

  ```
  source bigdata_env
  ```

- 初始化zk

  ```
  init_zk
  ```

- 初始化hdfs

  ```
  init_hdfs
  ```

## 启动

- 启动hadoop

  ```
  op_start_all
  ```

  