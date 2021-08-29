#!/bin/bash
export BIGDATA_HOME=/opt/bigdata
export BIGDATA_CONF=$BIGDATA_HOME/etc
export BIGDATA_LOG=/opt/bigdata/logs

if [[ -d "$BIGDATA_HOME/hadoop" ]]; then
  export HADOOP_HOME=$BIGDATA_HOME/hadoop
  source $BIGDATA_HOME/script/hadoop.sh
fi

if [[ -d "$BIGDATA_HOME/hive" ]]; then
  export HIVE_HOME=$BIGDATA_HOME/hive
  source $BIGDATA_HOME/script/hive.sh
fi

if [[ -d "$BIGDATA_HOME/tez" ]]; then
  export TEZ_CONF_DIR=$BIGDATA_CONF/tez
  export TEZ_JARS=$BIGDATA_HOME/tez
  export HADOOP_CLASSPATH=${TEZ_CONF_DIR}:${TEZ_JARS}/*:${TEZ_JARS}/lib/*
fi

if [[ -d "$BIGDATA_HOME/zookeeper" ]]; then
  export ZOO_HOME=$BIGDATA_HOME/zookeeper
  source $BIGDATA_HOME/script/zookeeper.sh
fi

if [[ -d "$BIGDATA_HOME/hbase" ]]; then
  export HBASE_HOME=$BIGDATA_HOME/hbase
fi

if [[ -d "$BIGDATA_HOME/kafka" ]]; then
  export KAFKA_HOME=$BIGDATA_HOME/kafka
fi

if [[ -d "$BIGDATA_HOME/kafka-manager" ]]; then
  export KAFKA_MANAGER_HOME=$BIGDATA_HOME/kafka-manager
fi

if [[ -d "$BIGDATA_HOME/alluxio" ]]; then
  export ALLUXIO_HOME=$BIGDATA_HOME/alluxio
  source $BIGDATA_HOME/script/alluxio.sh
fi

if [[ -d "$BIGDATA_HOME/spark" ]]; then
  export SPARK_HOME=$BIGDATA_HOME/spark
fi

if [[ -n $HADOOP_HOME ]]; then
  export PATH=$HADOOP_HOME/bin:$PATH
  export PATH=$HADOOP_HOME/sbin:$PATH

  export HADOOP_CONF_DIR=$BIGDATA_CONF/hadoop
  export HADOOP_LOG_DIR=$BIGDATA_LOG/hadoop
  export YARN_CONF_DIR=$BIGDATA_CONF/hadoop
  export YARN_LOG_DIR=$BIGDATA_LOG/hadoop
fi

if [[ -n $ALLUXIO_HOME ]]; then
  export PATH=$ALLUXIO_HOME/bin:$PATH
  export ALLUXIO_CONF_DIR=$BIGDATA_CONF/alluxio
  export ALLUXIO_LOGS_DIR=$BIGDATA_LOG/alluxio
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

if [[ -n $SPARK_HOME ]]; then
  export PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH
fi
