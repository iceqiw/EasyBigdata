#!/bin/bash

usage="Usage: hadoop-daemon.sh [--config <conf-dir>] [--hosts hostlistfile] [--script script] (start|stop) <hadoop-command> <args...>"

command=$1
shift

hadoop_fun(){
  hdfs namenode -format
}

hive_fun(){
  hadoop fs -mkdir -p /user/hive/warehouse
}


case $command in

  (hadoop)
    hadoop_fun
    ;;
  (hive)
    hive_fun
    ;;
  (*)
    echo $usage
    exit 1
    ;;
esac