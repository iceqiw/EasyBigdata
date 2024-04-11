# How to apply job

## (0) export HADOOP_CLASSPATH
export HADOOP_CLASSPATH=`hadoop classpath`

## apply job
flink run-application -t yarn-application ./flink/examples/streaming/TopSpeedWindowing.jar

