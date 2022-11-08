## 定义工作目录

```
export BIGDATAHOME=/path/bigdata 为软件安装目录
```
OR

Add below on head of bigdata_env

```
export BIGDATAHOME=/path/bigdata 为软件安装目录
```

## 修改配置

## 建立配置链接

- 进入$BIGDATAHOME，建立Hadoop 软连接

  ```
  ln -s hadoop-3.x.x hadoop
  ```
  
- 进入安装 Hadoop 目录，删除目录hadoop/etc/hadoop，并创建软连接 
  ```
  ln -s  $工作目录/EasyBigdata/etc/hadoop-default hadoop
  ```
  
- 激活配置 bigdata_env 文件
  ```
  source bigdata_env
  ```
  

# 组件参考

- Hadoop : Hadoop.md

- HBase: HBase.md

- Hive: Hive.md

- Kafka: Kafka.md

