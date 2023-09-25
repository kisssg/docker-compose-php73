FROM php:7.3-fpm

RUN apt-get update && apt-get install -y \
    redis-server \
    memcached

# Install Redis extension for PHP
RUN pecl install redis

# Install Memcached extension for PHP
RUN pecl install memcached

# Enable Redis and Memcached extensions
RUN docker-php-ext-enable redis memcached