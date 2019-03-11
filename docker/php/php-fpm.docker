FROM php:7.3-fpm

RUN apt-get update && apt-get install -y libwebp-dev libjpeg62-turbo-dev libpng-dev libxpm-dev libfreetype6-dev

RUN docker-php-ext-configure gd --with-gd --with-webp-dir --with-jpeg-dir \
    --with-png-dir --with-zlib-dir --with-xpm-dir --with-freetype-dir \
    --enable-gd-native-ttf

RUN docker-php-ext-install gd mysqli opcache pdo pdo_mysql

RUN pecl install xdebug-2.7.0beta1 \
    && docker-php-ext-enable xdebug

# Sendmail
RUN apt-get update &&\
    apt-get install --no-install-recommends --assume-yes --quiet ca-certificates curl git &&\
    rm -rf /var/lib/apt/lists/*
RUN curl -Lsf 'https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz' | tar -C '/usr/local' -xvzf -
ENV PATH /usr/local/go/bin:$PATH
RUN go get github.com/mailhog/mhsendmail
RUN cp /root/go/bin/mhsendmail /usr/bin/mhsendmail

ADD ./php.ini /usr/local/etc/php/conf.d/php.ini
ADD ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini
ADD ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
ADD ./memcached.ini /usr/local/etc/php/conf.d/memcached.ini

RUN usermod -u 1000 www-data
RUN chmod 777 -R /tmp && chmod o+t -R /tmp

WORKDIR /var/www/bitrix