# How to apply job
```
.
├── docker-compose.yml
├── etc
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

