# CentOS with JDK 8
# Author        qiwei

# build a new image with basic  centos
FROM centos:7
# who is the author
MAINTAINER qiwei

RUN yum -y install java-11-openjdk java-11-openjdk-devel

# set java environment variables
ENV JAVA_HOME /usr/lib/jvm/java
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH

# install openssh
RUN yum -y  install openssh-server openssh-clients

RUN ssh-keygen -A
RUN ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
RUN cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

RUN echo "root:123456" | chpasswd

RUN useradd --create-home --no-log-init --shell /bin/bash doper
RUN echo 'doper:123456' | chpasswd
RUN mkdir -p /opt/bigdata
RUN chown -R doper:doper /opt/bigdata
WORKDIR /opt/bigdata
# set password of root

# when start a container it will be executed
CMD ["/usr/sbin/sshd","-D"]