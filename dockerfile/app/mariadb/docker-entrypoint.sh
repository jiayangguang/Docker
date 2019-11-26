#!/bin/bash

export MYSQL_ROOT_PASSWORD=`cat /proc/1/environ|tr '\0' '\n'|awk -F'=' '/MYSQL_ROOT_PASSWORD/{print $2}'`

case $1 in
    start_all) 
      /usr/bin/supervisord -c /etc/supervisord.conf;;
    init) [ ! -z $MYSQL_ROOT_PASSWORD ]&& echo -e "\nY\n${MYSQL_ROOT_PASSWORD}\n${MYSQL_ROOT_PASSWORD}\nY\nn\nY\nY\n" | mysql_secure_installation;;
    start) supervisorctl start mariadb;;
    stop) supervisorctl stop mariadb;;
       *) /usr/bin/supervisord -c /etc/supervisord.conf;;
esac
