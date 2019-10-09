#!/bin/bash

usage="Usage: hadoop-daemon.sh [--config <conf-dir>] [--hosts hostlistfile] [--script script] (start|stop) <hadoop-command> <args...>"

command=$1
shift
master_fun(){
  hdfs --daemon start namenode
  yarn --daemon start resourcemanager
}

slave_fun(){
  hdfs --daemon start datanode
  yarn --daemon start nodemanager
}


case $command in

  (master)
    master_fun
    ;;
  (slave)
    slave_fun
    ;;
  (*)
    echo $usage
    exit 1
    ;;
esac

