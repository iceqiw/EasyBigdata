#!/bin/bash

function init_hive() {
  echo "hive warehouse Initialization"
  hadoop fs -mkdir -p /user/hive/warehouse
  hadoop fs -chown hive:hive /user/hive
  hadoop fs -chown hive:hive /user/hive/warehouse
  echo "warehouse Initialization complete"
}

function init_hms_db() {
  schematool -dbType postgres -initSchema
}

function start_hive() {
  # 3 启动hive metastore
  nohup hive --service metastore &

  # 4 启动hive server
  nohup hiveserver2 &
}

function stop_hive() {
  kill_hs2
  kill_hms
}

function kill_hs2() {
  ps -ef | grep hiveserver2 | awk '{print $2}' | xargs kill -9
}

function kill_hms() {
  ps -ef | grep metastore | awk '{print $2}' | xargs kill -9
}

function hbc() {
  beeline -u jdbc:hive2://hadoop-master1:10000 -n $1
}
