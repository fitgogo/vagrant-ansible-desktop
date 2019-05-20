#!/bin/sh

docker run --name mariadb\
	-v /home/vagrant/tools/mysql_container/mycnf:/etc/mysql/conf.d \
	-v /home/vagrant/tools/mysql_container/mysql:/mnt \
	-e MYSQL_ROOT_PASSWORD=password \
	-e MYSQL_DATABASE=james \
	-p 3306:3306 \
	-d mariadb:10.4.4
