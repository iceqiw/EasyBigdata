## 修改环境变量

```
export BIGDATAHOME=/opt/bigdata 为软件安装目录
```

## 部署参考

Hadoop : Hadoop.md

HBase: HBase.md

Hive: Hive.md

Kafka: Kafka.md

## 修改配置

## 建立配置链接

- 进入安装 Hadoop目录，替换 目录hadoop-3.2.2/etc/hadoop 

  

`ln -s  $工作目录/EasyBigdata/etc/hadoop-default hadoop`

```shell
 hadoop -> /Users/qw/Workspace/EasyBigdata/etc/hadoop-default
```