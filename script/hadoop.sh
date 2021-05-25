#!/bin/bash

function vaild_host() {
    if [[ $(grep -c bd-master-1 /etc/hosts) -eq 0 ]]; then
        echo 'need to edit etc hosts'
        return 0
    else
        return 1
    fi
}

function init_hdfs() {
    echo "hdfs init start"
    hdfs namenode -format
}

function op_master() {
    if vaild_host; then
        return
    fi

    case $1 in
    start)
        echo 'start hadoop nn,rm'
        hdfs --daemon start namenode
        yarn --daemon start resourcemanager
        ;;
    stop)
        echo 'stop hadoop nn,rm'
        hdfs --daemon stop namenode
        yarn --daemon stop resourcemanager
        ;;
    restart)
        echo 'restart'
        hdfs --daemon stop namenode
        yarn --daemon stop resourcemanager
        hdfs --daemon start namenode
        yarn --daemon start resourcemanager
        ;;
    *)
        echo 'input correct command'
        ;;
    esac
}

function op_slave() {
    if vaild_host; then
        return
    fi

    case $1 in
    start)
        echo 'start hadoop dn,nm'
        hdfs --daemon start datanode
        yarn --daemon start nodemanager
        ;;
    stop)
        echo 'stop hadoop dn,nm'
        hdfs --daemon stop datanode
        yarn --daemon stop nodemanager
        ;;
    restart)
        echo 'restart'
        hdfs --daemon stop datanode
        yarn --daemon stop nodemanager
        hdfs --daemon start datanode
        yarn --daemon start nodemanager
        ;;
    *)
        echo 'input correct command'
        ;;
    esac
}

function op_start_mr_js() {
    echo 'start jobhistory server'
    mr-jobhistory-daemon.sh start historyserver
}

function op_stop_mr_js() {
    echo 'stop jobhistory server'
    mr-jobhistory-daemon.sh stop historyserver
}

function op_stop_all() {
    echo 'stop all server'
    hdfs --daemon stop datanode
    yarn --daemon stop nodemanager

    hdfs --daemon stop namenode
    yarn --daemon stop resourcemanager
}

function op_stop_other() {
    echo 'stop js,ts server'

    mr-jobhistory-daemon.sh stop historyserver

    yarn --daemon stop timelineserver
}

function op_start_all() {
    echo 'start all server'
    hdfs --daemon start namenode
    yarn --daemon start resourcemanager

    hdfs --daemon start datanode
    yarn --daemon start nodemanager
}

function ha_start_all() {
    echo 'start all server'
    hdfs --config etc/hadoop-ha --daemon start namenode
    yarn --config etc/hadoop-ha --daemon start resourcemanager

    hdfs --config etc/hadoop-ha --daemon start datanode
    yarn --config etc/hadoop-ha --daemon start nodemanager
}

function hdfs_security_start_all() {
    echo 'start hdfs security server'
    hdfs --config etc/hadoop-security --daemon start namenode
    hdfs --config etc/hadoop-security --daemon start datanode
}

function hdfs_security_stop_all() {
    echo 'stop hdfs security server'
    hdfs --config etc/hadoop-security --daemon stop namenode
    hdfs --config etc/hadoop-security --daemon stop datanode
}

function yarn_start_all() {
    echo 'start yarn server'
    yarn --daemon start resourcemanager
    yarn --config etc/hadoop-for-nm --daemon start nodemanager
}

function yarn_stop_all() {
    echo 'stop yarn server'
    yarn --daemon stop resourcemanager
    yarn --config etc/hadoop-for-nm --daemon stop nodemanager
}

function hdfs_start_all() {
    echo 'start hdfs server'
    hdfs --daemon start namenode
    hdfs --daemon start datanode
}

function hdfs_stop_all() {
    echo 'stop hdfs server'
    hdfs --daemon stop namenode
    hdfs --daemon stop datanode
}

function op_start_other() {
    echo 'start js,ts server'
    mr-jobhistory-daemon.sh start historyserver

    yarn --daemon start timelineserver
}

function yarn_router_start() {
    yarn --daemon start router
}

function yarn_router_stop() {
    echo $HADOOP_OPTS
    yarn --daemon stop router
}

function yarn_fer_test() {
    #export HADOOP_OPTS="$HADOOP_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5007"
    yarn --config etc/hadoop-cli jar hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.3.jar pi 10 10
    #unset HADOOP_OPTS
}

function yarn_test() {
    yarn jar hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.3.jar pi 10 10
}

function debug_rm() {
    jps | grep ResourceManager | awk '{print $1}' | xargs kill -9
    export HADOOP_OPTS="$HADOOP_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5008"
    yarn --daemon start resourcemanager
    unset HADOOP_OPTS
}

function debug_nm() {
    jps | grep NodeManager | awk '{print $1}' | xargs kill -9
    export HADOOP_OPTS="$HADOOP_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5006"
    yarn --config etc/hadoop-for-nm --daemon start nodemanager
    unset HADOOP_OPTS
}

function debug_router() {
    jps | grep Router | awk '{print $1}' | xargs kill -9
    export HADOOP_OPTS="$HADOOP_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"
    yarn --config etc/hadoop-router --daemon start router
    unset HADOOP_OPTS
}

function yarn_start_fer_rm() {
    echo 'start yarn rm federtion server'
    jps | grep ResourceManager | awk '{print $1}' | xargs kill -9
    yarn --config etc/hadoop-federation-rm --daemon start resourcemanager
}

function yarn_start_fer_nm() {
    echo 'start yarn rm federtion server'
    jps | grep NodeManager | awk '{print $1}' | xargs kill -9
    yarn --config etc/hadoop-federation-nm --daemon start nodemanager
}

function replace_job_xml() {
    echo "/tmp/hadoop-yarn/staging/tw/.staging/$1"
    hdfs dfs -ls /tmp/hadoop-yarn/staging/tw/.staging/$1
    hdfs dfs -get /tmp/hadoop-yarn/staging/tw/.staging/$1 $1
    sed -i "" 's/${yarn.resourcemanager.hostname}:8030/bd-master-1:8049/g' $1/job.xml
    hdfs dfs -put -f -p $1 /tmp/hadoop-yarn/staging/tw/.staging/
}
