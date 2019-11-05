#!/bin/bash

export BIGDATAHOME=/opt/bigdata
export HADOOP_HOME=$BIGDATAHOME/hadoop
export ZOO_HOME=$BIGDATAHOME/zookeeper
export HBASE_HOME=$BIGDATAHOME/hbase
export Hive_HOME=$BIGDATAHOME/hive
export KAFKA_HOME=$BIGDATAHOME/hbase

if [[ -n $HADOOP_HOME ]]; then
  export PATH=$HADOOP_HOME/bin:$PATH
  export PATH=$HADOOP_HOME/sbin:$PATH

  export HADOOP_CONF_DIR=/etc/hadoop
  export HADOOP_LOG_DIR=/var/logs/hadoop
  export YARN_CONF_DIR=/etc/hadoop
  export YARN_LOG_DIR=/var/logs/yarn
fi

if [[ -n $HIVE_HOME ]]; then
  export PATH=$HIVE_HOME/bin:$PATH
  export HIVE_CONF_DIR=/etc/hive
fi

if [[ -n $ZOO_HOME ]]; then
  export PATH=$ZOO_HOME/bin:$PATH
  export ZOOCFGDIR=/etc/zookeeper
fi

if [[ -n $KAFKA_HOME ]]; then
  export PATH=$KAFKA_HOME/bin:$PATH
fi

if [[ -n $HBASE_HOME ]]; then
  export PATH=$HBASE_HOME/bin:$PATH
  export PATH=$HBASE_HOME/sbin:$PATH
fi