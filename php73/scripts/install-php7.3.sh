#/bin/bash

set -eux

php_version=7.3
php_ini_dir=/etc/php7.3
php_src_dir=/usr/local/src/php7.3-src

mkdir -p ${php_src_dir} ${php_ini_dir} ${php_ini_dir}/conf.d

cd ${php_src_dir}

tar -xf /usr/local/src/php-7.3.33.tar.xz -C ${php_src_dir} --strip-components=1

./buildconf --force

./configure \
    --enable-option-checking=fatal \
    --prefix=/usr/local \
    --program-suffix=${php_version} \
    --sysconfdir=${php_ini_dir} \
    --with-config-file-path=${php_ini_dir} \
    --with-config-file-scan-dir=${php_ini_dir}/conf.d \
    --disable-cgi \
    --enable-fpm \
    --with-fpm-user=www-data \
    --with-fpm-group=www-data \
    --with-mhash \
    --with-pic \
    --enable-ftp \
    --enable-mbstring \
    --enable-mysqlnd \
    --with-password-argon2 \
    --with-sodium=shared \
    --with-pdo-sqlite=/usr \
    --with-sqlite3=/usr \
    --with-curl \
    --with-iconv \
    --with-openssl \
    --with-readline \
    --with-zlib \
    --disable-phpdbg \
    --with-pear

make -j $(nproc);
make -j $(nproc) install;

mv ${php_ini_dir}/php-fpm.conf.default ${php_ini_dir}/php-fpm.conf

mv ${php_ini_dir}/php-fpm.d/www.conf.default ${php_ini_dir}/php-fpm.d/www.conf
