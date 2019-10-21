#!/bin/bash

command=$1
shift
master_start_fun(){
  hdfs --daemon start namenode
  yarn --daemon start resourcemanager
}

slave_start_fun(){
  hdfs --daemon start datanode
  yarn --daemon start nodemanager
}

master_stop_fun(){
  hdfs --daemon stop namenode
  yarn --daemon stop resourcemanager
}

slave_stop_fun(){
  hdfs --daemon stop datanode
  yarn --daemon stop nodemanager
}


case $command in

  (master)
    master_start_fun
    ;;
  (slave)
    slave_start_fun
    ;;
  (master-stop)
    master_stop_fun
    ;;
  (slave-stop)
    slave_stop_fun
    ;;
  (*)
    echo $usage
    exit 1
    ;;
esac

