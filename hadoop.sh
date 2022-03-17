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
case $1 in
  all)
    echo "start hadoop"
    start
    echo "start hadoop finished"
    ;;
  stop)
    echo "stop job"
    stop
    echo "stop job finished"
    ;;
  *)
    echo "error input"
    ;;
esac

