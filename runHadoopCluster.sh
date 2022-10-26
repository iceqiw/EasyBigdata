function start(){
  hdfs --daemon start namenode
  hdfs --daemon start datanode

  yarn --daemon start resourcemanager
  yarn --daemon start nodemanager
  yarn --daemon start proxyserver
}

function stop(){
  hdfs --daemon stop namenode
  hdfs --daemon stop datanode

  yarn --daemon stop resourcemanager
  yarn --daemon stop nodemanager
  yarn --daemon stop proxyserver
}
read -p 'input start/stop to start cluster :  ' cmd

case $cmd in
  start)
    echo "start hadoop"
    start
    echo "start hadoop finished"
    ;;
  stop)
    echo "stop cluster"
    stop
    echo "stop cluster finished"
    ;;
  *)
    echo "error input"
    ;;
esac

