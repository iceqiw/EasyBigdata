# CentOS with JDK 8
# Author        qiwei

# build a new image with basic  centos
FROM centos-jdk
# who is the author
MAINTAINER qiwei


RUN mkdir -p /opt/data/hadoop/hdfs/name
RUN mkdir -p /opt/data/hadoop/hdfs/data
RUN mkdir -p /opt/data/hadoop/tmp
RUN mkdir -p /var/log/hadoop
RUN mkdir -p /var/log/hive

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