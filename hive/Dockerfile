# CentOS with JDK 8
# Author        qiwei

# build a new image with basic  centos
FROM centos-hadoop
# who is the author
MAINTAINER qiwei

# copy the hadoop  archive to the image,and it will automaticlly unzip the tar file
ADD apache-hive-1.2.3-SNAPSHOT-bin.tar.gz /opt
# make a symbol link
RUN ln -s /opt/apache-hive-1.2.3-SNAPSHOT-bin /opt/hive
RUN mkdir -p /opt/data/hive/data

COPY hive-site.xml /opt/hive/conf/

COPY init.sh /opt/

ENV HIVE_HOME=/opt/hive
ENV HIVE_CONF_DIR=$HIVE_HOME/conf

ENV PATH ${HIVE_HOME}/bin:$PATH

RUN chmod +x /opt/init.sh

