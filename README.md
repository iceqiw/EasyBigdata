## 修改bigdata_env 文件

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

- 进入$BIGDATAHOME，建立Hadoop 软连接

  example:
  ```
  ln -s hadoop-3.2.2 hadoop
  ```

- 进入安装 Hadoop 目录，删除目录hadoop/etc/hadoop，并创建软连接 
  example:
  ```
  ln -s  $工作目录/EasyBigdata/etc/hadoop-default hadoop
  ```

- 激活配置 :bigdata_env 文件
  example:
  ```
  source bigdata_env
  ```

  

