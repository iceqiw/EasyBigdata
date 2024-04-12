#!/bin/bash
function start(){
  echo "start dn"
  hdfs --daemon start datanode
  echo "start nm"
  yarn --daemon start nodemanager
}

start
sleep infinity
