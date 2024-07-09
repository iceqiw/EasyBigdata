#!/bin/bash
hadoop fs -mkdir       /tmp
hadoop fs -mkdir       /user/hive/warehouse
hadoop fs -chmod g+w   /tmp
hadoop fs -chmod g+w   /user/hive/warehouse

schematool -dbType derby -initSchema

hiveserver2 &

hcat_server.sh &
