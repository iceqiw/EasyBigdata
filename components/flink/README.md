# How to apply job
```
.
├── docker-compose.yml
├── Dockerfile-ubuntu-jdk11
├── etc
├── flink -> /home/weiqi/dev/flink-1.14.6
├── hadoop -> /home/weiqi/dev/hadoop-3.3.4
├── README.md
└── script
```
## export HADOOP_CLASSPATH
``` shell
export HADOOP_CLASSPATH=`hadoop classpath`
```

## apply job
``` shell
flink run-application -t yarn-application ./flink/examples/streaming/TopSpeedWindowing.jar
```


## Start YARN Session
``` shell 
yarn-session.sh --detached
```

