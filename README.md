

### 善意提醒提高docker container 的内存大小，被坑了好久。

# docker 镜像构建命令e.g

```
docker build -t bigdata:1.0 .
```

## 修改yml文件中的挂载目录e.g

```
volumes:
      - ~/bigdata/hadoop:/opt/bigdata/hadoop
      - ./etc/hadoop:/opt/bigdata/etc/hadoop
      - ./env/bigdata_env.sh:/etc/profile.d/bigdata_env.sh

# ~/bigdata/hadoop 为本地hadoop安装目录
```


## 构建集群运行环境命令e.g

```
docker-compose -f mac-docker-compose-hadoop.yml up -d
```
## 修改环境变量bigdata-docker/build-env/env/bigdata_env.sh

```
export BIGDATAHOME=/opt/bigdata 为安装目录

```
## 部署参考

Hadoop : Hadoop.md

HBase: HBase.md

Hive: Hive.md

Kafka: Kafka.md

## 本地部署

### 结构介绍【本地环境需要将bigdata_env，etc，sbin】映射到/opt/bigdata 下

```shell
├── bigdata_env 【环境变量】
├── build-env
├── etc 【本地配置目录】
├── Hadoop.md
├── HBase.md
├── hd-container
├── Hive.md
├── Kafka.md
├── kdc
├── kerberos install.md
├── local-env.md
├── README.md
└── sbin 【初始化，启动脚本】
```

```shell
# /opt/bigdata

├── bigdata_env -> /home/qiwei/workspace/bigdata-docker/bigdata_env
├── etc -> /home/qiwei/workspace/bigdata-docker/etc
├── hadoop
├── hive
├── java -> /home/qiwei/dev/jdk1.8.0_241
├── sbin -> /home/qiwei/workspace/bigdata-docker/sbin
├── tez
└── tez-0.9.2-minimal.tar.gz
```

- 将Hive 安装包解压后重命名为hive
- 将Hadoop安装包解压后重命名为hadoop