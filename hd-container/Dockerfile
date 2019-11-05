# CentOS with JDK 8
# Author        qiwei

# build a new image with basic  centos
FROM centos:7
# who is the author
MAINTAINER qiwei

# add jdk
RUN mkdir /usr/local/java
ADD jdk-8u231-linux-x64.tar.gz /usr/local/java/
# make a symbol link
RUN ln -s /usr/local/java/jdk1.8.0_231 /usr/local/java/jdk

# set java environment variables
ENV JAVA_HOME /usr/local/java/jdk
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib
ENV PATH ${JAVA_HOME}/bin:$PATH

# install openssh
RUN yum -y  install openssh-server openssh-clients
RUN yum -y  install vim which net-tools

#generate key files
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -q -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N ''

# login localhost without password
RUN ssh-keygen -f /root/.ssh/id_rsa -N ''
RUN touch /root/.ssh/authorized_keys
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys

# set password of root
RUN echo "root:123456" | chpasswd

# open the port 22
EXPOSE 22
# when start a container it will be executed
CMD ["/usr/sbin/sshd","-D"]