# CentOS image with redhat high availability

FROM test/centos7

MAINTAINER weijiaqin

RUN yum groupinstall ha -y && yum clean all

# Outside Port
EXPOSE 22

#supervisord start
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
