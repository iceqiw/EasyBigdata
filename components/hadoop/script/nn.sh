#!/bin/bash
function start(){
  hdfs namenode -format
  hdfs --daemon start namenode
}


start
