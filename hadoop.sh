function start(){
  hdfs --daemon start namenode
  hdfs --daemon start datanode

  yarn --daemon start resourcemanager
  yarn --daemon start nodemanager
  yarn --daemon start proxyserver
}


echo "start hadoop"

start

echo "start hadoop finish"
