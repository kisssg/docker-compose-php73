#!/bin/bash

set -eux

# sed -i "s|http://deb.debian.org/debian|http://mirrors.ustc.edu.cn/debian|g" /etc/apt/sources.list;

apt-get update

apt-get install -y --no-install-recommends --no-install-suggests \
    autoconf dpkg-dev file g++ gcc libc-dev make pkg-config bison re2c \
    libargon2-dev libcurl4-openssl-dev libonig-dev libreadline-dev \
    libsodium-dev libsqlite3-dev libssl-dev libxml2-dev zlib1g-dev \
    curl ca-certificates lsb-release debian-archive-keyring \
    wget debconf debconf-utils lsb-release gnupg \
    iputils-ping iproute2 zip unzip xz-utils apt-utils

