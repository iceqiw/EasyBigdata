#!/bin/bash
function start(){
  echo "format"
  hdfs namenode -format
  echo "start nn"
  hdfs --daemon start namenode
  echo "start rm"
  yarn --daemon start resourcemanager
  echo "start proxy"
  yarn --daemon start proxyserver
}


start
sleep infinity
