##
hadoop 命令

`hdfs namenode -format`

`hadoop-daemon.sh start namenode`

`hadoop-daemon.sh start datanode`

`yarn-daemon.sh start resourcemanager`

`yarn-daemon.sh start nodemanager`

`hadoop fs -mkdir -p /user/hive/warehouse`

#### docker 运行命令

```bash

docker run -it --name hadoop0 --hostname hadoop-1 -p 50070:50070 -p 8088:8088 -p 8000:8000 -p 10000:10000 centos-hive /bin/bash

#windows
docker run -it --name hadoop0 --hostname hadoop-1 --network mynetwork --ip 172.18.0.3 centos-hive /bin/bash
```

```bash
#启动dockers
docker-compose -f docker-compose-hdfs.yml up -d

```

