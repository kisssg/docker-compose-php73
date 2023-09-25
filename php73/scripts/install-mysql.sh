#!/bin/bash

set -eux

# export DEBIAN_FRONTEND=noninteractive

groupadd -r mysql && useradd -r -g mysql mysql

key='859BE8D7C586F538430B19C2467B942D3A79BD29'; \
	gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key"; \
	mkdir -p /etc/apt/keyrings; \
	gpg --batch --export "$key" > /etc/apt/keyrings/mysql.gpg; \

echo 'deb [ signed-by=/etc/apt/keyrings/mysql.gpg ] http://repo.mysql.com/apt/debian/ bullseye mysql-8.0' > /etc/apt/sources.list.d/mysql.list

debconf-set-selections /usr/local/src/mysql-apt-config.txt

# dpkg -i /usr/local/src/mysql-apt-config_0.8.24-1_all.deb

apt-get update

apt-get install -y --no-install-recommends --no-install-suggests \
    mysql-community-server-core \
    mysql-community-client

mkdir -p /var/lib/mysql /var/run/mysqld

chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

chmod 1777 /var/run/mysqld /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Creating the default database"
    mysqld --initialize-insecure
else
    echo "MySQL database already initialiazed"
fi
