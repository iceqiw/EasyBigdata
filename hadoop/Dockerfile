# CentOS with JDK 8
# Author        qiwei

# build a new image with basic  centos
FROM centos-ssh
# who is the author
MAINTAINER qiwei

# copy the hadoop  archive to the image,and it will automaticlly unzip the tar file
ADD hadoop-2.7.7.tar.gz /opt
# make a symbol link
RUN ln -s /opt/hadoop-2.7.7 /opt/hadoop
RUN mkdir -p /opt/data/hadoop/hdfs/name
RUN mkdir -p /opt/data/hadoop/hdfs/data
RUN mkdir -p /opt/data/hadoop/tmp

COPY core-site.xml /opt/hadoop/etc/hadoop/
COPY hdfs-site.xml /opt/hadoop/etc/hadoop/
COPY mapred-site.xml /opt/hadoop/etc/hadoop/
COPY yarn-site.xml /opt/hadoop/etc/hadoop/

RUN yum -y  install vim which

RUN sed -i "s?JAVA_HOME=\${JAVA_HOME}?JAVA_HOME=/usr/local/java/jdk?g" /opt/hadoop/etc/hadoop/hadoop-env.sh

ENV HADOOP_HOME /opt/hadoop
ENV HADOOP_CONF_DIR $HADOOP_HOME/etc/hadoop

ENV PATH ${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:$PATH

