#!/bin/bash

usage="Usage: hadoop-daemon.sh [--config <conf-dir>] [--hosts hostlistfile] [--script script] (start|stop) <hadoop-command> <args...>"

command=$1
shift
master_fun(){
  hadoop-daemon.sh start namenode
  yarn-daemon.sh start resourcemanager
}

slave_fun(){
  hadoop-daemon.sh start datanode
  yarn-daemon.sh start nodemanager
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

