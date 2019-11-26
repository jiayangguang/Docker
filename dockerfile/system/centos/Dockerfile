# CentOS Base image

FROM centos:7

MAINTAINER weijiaqin

RUN rpm -ivh http://mirrors.aliyun.com/epel/epel-release-latest-7.noarch.rpm \
    && yum install -y openssh-clients supervisor openssl-devel openssh-server gcc gcc-c++ make dos2unix lsof net-tools nc nmap vim tree wget \
    && yum clean all
# For SSHD
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
    && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key \
    && ssh-keygen -A -t dsa -f /etc/ssh/ssh_host_dsa_key \
    && echo "root:rootpwd" | chpasswd
RUN echo "*            -       nofile         65535" >> /etc/security/limits.conf && ulimit -SHn 65535

#Supervisord config
ADD supervisord.conf /etc/supervisord.conf
ADD sshd.ini /etc/supervisord.d/sshd.ini

# Outside Port
EXPOSE 22

#supervisord start
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
