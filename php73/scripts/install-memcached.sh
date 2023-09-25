#!/bin/bash

set -eux

apt-get install -y --no-install-recommends --no-install-suggests libevent-dev

# wget -O /usr/local/src/memcached.tar.gz http://memcached.org/latest

mkdir -p /usr/local/src/memcached

tar -xzf /usr/local/src/memcached.tar.gz -C /usr/local/src/memcached --strip-components=1

cd /usr/local/src/memcached

./configure && make && make test && make install
