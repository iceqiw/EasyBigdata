#!/bin/bash
if [[ -n $HADOOP_HOME ]]; then
  export PATH=$HADOOP_HOME/bin:$PATH
  export PATH=$HADOOP_HOME/sbin:$PATH
fi

if [[ -n $HIVE_HOME ]]; then
  export PATH=$HIVE_HOME/bin:$PATH
fi

if [[ -n $ZOO_HOME ]]; then
  export PATH=$ZOO_HOME/bin:$PATH
fi

if [[ -n $KAFKA_HOME ]]; then
  export PATH=$KAFKA_HOME/bin:$PATH
fi