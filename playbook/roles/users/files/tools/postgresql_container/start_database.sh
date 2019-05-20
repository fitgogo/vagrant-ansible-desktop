#!/bin/sh

docker run --name postgresql\
	-v /home/vagrant/tools/postgresql_container/postgresql:/mnt\
	-e POSTGRES_USER=root\
	-e POSTGRES_PASSWORD=password\
	-e POSTGRES_DB=james\
	-p 5432:5432\
	-d postgres:11.3
