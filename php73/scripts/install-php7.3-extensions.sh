#/bin/bash

set -eux

ext_src_dir=/usr/local/src/php7.3-src/ext


ext_bcmath()
{
    cd $ext_src_dir/bcmath
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
}


ext_bz2()
{
    apt-get install -y --no-install-recommends --no-install-suggests libbz2-dev
    cd $ext_src_dir/bz2
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
}

ext_calendar()
{
    cd $ext_src_dir/calendar
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
}


ext_ctype()
{
    cd $ext_src_dir/ctype;
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
}

ext_curl()
{
    apt-get install -y --no-install-recommends --no-install-suggests libcurl4-gnutls-dev
    cd $ext_src_dir/curl
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
}

ext_gd()
{
    # apt-get install -y --no-install-recommends --no-install-suggests zlib1g-dev libpng-dev libjpeg-dev libxpm-dev libfreetype6-dev libwebp-dev
    cd $ext_src_dir/gd
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3 #--with-webp --with-jpeg --with-xpm --with-freetype
    make -j $(nproc) && make -j $(nproc) install
    echo "extension=gd" > /etc/php7.3/conf.d/ext_gd.ini
}

ext_imagick()
{
    apt-get install -y --no-install-recommends --no-install-suggests  libmagickwand-dev
    pecl install imagick
}

ext_mbstring()
{
    apt-get install -y --no-install-recommends --no-install-suggests libonig-dev
    cd $ext_src_dir/mbstring
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
}

ext_mysqlnd()
{
    ext_src_dir=/var/tmp/magic-box/php-src-php-7.3.33/ext
    cd $ext_src_dir/mysqlnd
    cp config9.m4 config.m4
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
}

# require mysqlnd
ext_mysqli()
{
    # apt-get install -y --no-install-recommends --no-install-suggests libssl-dev
    cd $ext_src_dir/mysqli
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
    echo "extension=mysqli" > /etc/php7.3/conf.d/ext_mysqli.ini
}


ext_openssl()
{
    apt-get install -y --no-install-recommends --no-install-suggests libssl-dev
    cd $ext_src_dir/openssl
    cp config0.m4 config.m4
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
}

ext_pdo_mysql()
{
    cd $ext_src_dir/pdo_mysql
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
    echo "extension=pdo_mysql" > /etc/php7.3/conf.d/ext_pdo_mysql.ini
}

ext_sodium()
{
    apt-get install -y --no-install-recommends --no-install-suggests libsodium-dev
    cd $ext_src_dir/sodium
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
}

ext_zip()
{
    apt-get install -y --no-install-recommends --no-install-suggests libzip-dev
    cd $ext_src_dir/zip
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
    echo "extension=zip" > /etc/php7.3/conf.d/ext_zip.ini
}

ext_zlib()
{
    apt-get install -y --no-install-recommends --no-install-suggests zlib1g-dev
    cd $ext_src_dir/zlib
    cp config0.m4 config.m4
    phpize7.3
    ./configure --with-php-config=/usr/local/bin/php-config7.3
    make -j $(nproc) && make -j $(nproc) install
}

ext_memcached()
{
    apt-get install -y --no-install-recommends --no-install-suggests libmemcached-dev
    pecl install memcached
}


pear config-set php_ini /etc/php7.3/php.ini

ext_memcached

ext_imagick

ext_gd

ext_mysqli

ext_pdo_mysql

ext_zip
