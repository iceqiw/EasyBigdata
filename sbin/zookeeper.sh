function init_zk() {
    # 1.初始化目录 所有节点
    mkdir -p /opt/bigdata/data/zookeeper
    # 2.指定zk myid
    echo 1 >/opt/bigdata/data/zookeeper/myid
}

function zk_start() {
    zkServer.sh start
}

function zk_stop() {
    zkServer.sh stop
}
