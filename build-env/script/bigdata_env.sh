#!/bin/bash
if [[ -n $HADOOP_HOME ]]; then
  export PATH=$HADOOP_HOME/bin:$PATH
  export PATH=$HADOOP_HOME/sbin:$PATH
fi

if [[ -n $HIVE_HOME ]]; then
  export PATH=$HIVE_HOME/bin:$PATH
fi

export PATH=/opt/script:$PATH