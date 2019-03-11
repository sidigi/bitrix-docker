FROM php:7.3-fpm

RUN apt-get update && apt-get install -y wget

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer --version

ADD ./php.ini /usr/local/etc/php/conf.d/php.ini
ADD ./php.ini /usr/local/etc/php/conf.d/php.ini

RUN usermod -u 1000 www-data

WORKDIR /var/www/bitrix