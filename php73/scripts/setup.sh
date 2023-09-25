#!/bin/bash

set -eux

update-alternatives --install /usr/local/bin/php php /usr/local/bin/php7.3 10

curl -o /usr/local/bin/composer https://getcomposer.org/composer.phar

chmod a+x /usr/local/bin/composer; 

curl -sL https://deb.nodesource.com/setup_current.x | bash -

apt-get install -y --no-install-recommends --no-install-suggests \
    nodejs git openssh-client supervisor

cp /usr/local/src/php7.3-src/php.ini-development /etc/php7.3/php.ini

