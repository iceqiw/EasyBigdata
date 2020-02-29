#!/bin/bash

function vaild_host() {
  if [[ $(grep -c hadoop-master1 /etc/hosts) -eq 0 ]]; then
    echo 'need to edit etc hosts'
    return 0
  else
    return 1
  fi
}

function hdfs_init() {
  echo "hdfs init start"
  hdfs namenode -format
  echo "hdfs init end"
}

function master() {
  if vaild_host; then
    return
  fi

  case $1 in
  start)
    echo '启动hadoop集群'
    hdfs --daemon start namenode
    yarn --daemon start resourcemanager
    ;;
  stop)
    echo '停止hadoop集群'
    hdfs --daemon stop namenode
    yarn --daemon stop resourcemanager
    ;;
  restart)
    echo '重启'
    hdfs --daemon stop namenode
    yarn --daemon stop resourcemanager
    hdfs --daemon start namenode
    yarn --daemon start resourcemanager
    ;;
  *)
    echo '请输入正确的命令'
    ;;
  esac
}

function slave() {
  if vaild_host; then
    return
  fi

  case $1 in
  start)
    echo '启动hadoop集群'
    hdfs --daemon start datanode
    yarn --daemon start nodemanager
    ;;
  stop)
    echo '停止hadoop集群'
    hdfs --daemon stop datanode
    yarn --daemon stop nodemanager
    ;;
  restart)
    echo '重启'
    hdfs --daemon stop datanode
    yarn --daemon stop nodemanager
    hdfs --daemon start datanode
    yarn --daemon start nodemanager
    ;;
  *)
    echo '请输入正确的命令'
    ;;
  esac
}
