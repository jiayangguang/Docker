# CentOS Base image

FROM test/centos7

MAINTAINER weijiaqin

# install MariaDB server:
RUN yum install -y mariadb* \
    && mysql_install_db --basedir=/usr/ --datadir=/var/lib/mysql/ \
    && chown -R mysql:mysql /var/lib/mysql

RUN yum groupinstall ha -y \
    && yum clean all

ADD mariadb.ini /etc/supervisord.d/mariadb.ini

# Outside Port
EXPOSE 22
EXPOSE 3306

COPY docker-entrypoint.sh /usr/local/bin/

#ENTRYPOINT ["docker-entrypoint.sh"]

#supervisord start
CMD ["docker-entrypoint.sh","start_all"]
