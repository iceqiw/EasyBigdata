# CentOS with JDK 8
# Author        qiwei

# build a new image with basic  centos
FROM centos
# who is the author
MAINTAINER qiwei

# make a new directory to store the jdk files
RUN mkdir /usr/local/java

# copy the jdk  archive to the image,and it will automaticlly unzip the tar file
ADD jdk-8u211-linux-x64.tar.gz /usr/local/java/

# make a symbol link
RUN ln -s /usr/local/java/jdk1.8.0_211 /usr/local/java/jdk

# set environment variables
ENV JAVA_HOME /usr/local/java/jdk
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH