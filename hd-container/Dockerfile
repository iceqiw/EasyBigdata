# CentOS with JDK 8
# Author        qiwei

# build a new image with basic  centos
FROM centos:7
# who is the author
MAINTAINER qiwei

# add jdk
RUN mkdir /usr/local/java
ADD jdk-8u241-linux-x64.tar.gz /usr/local/java/
# make a symbol link
RUN ln -s /usr/local/java/jdk1.8.0_241 /opt/bigdata/java

# set java environment variables
ENV JAVA_HOME /opt/bigdata/java
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH

# install openssh
RUN yum -y  install openssh-server openssh-clients
RUN yum -y  install vim which net-tools

# set password of root
RUN echo "root:123456" | chpasswd

# open the port 22
EXPOSE 22
# when start a container it will be executed
CMD ["/usr/sbin/sshd","-D"]