FROM dunglas/frankenphp@sha256:05ada5ce613fba6a98cbc9b23d2d36d461cb1219795edd6ef11fc7b5fa150984
#FROM dunglas/frankenphp:php8.5-bookworm

LABEL maintainer="Manuel Martinez <sina@serverscstrike.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    git \
    ca-certificates \
    && wget -q -O /tmp/composer.phar https://getcomposer.org/download/latest-stable/composer.phar \
    && SHA256=$(wget -q -O - https://getcomposer.org/download/latest-stable/composer.phar.sha256) \
    && echo "$SHA256 /tmp/composer.phar" | sha256sum -c - \
    && mv /tmp/composer.phar /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer \
    && install-php-extensions \
    bcmath \
    gd \
    gmp \
    intl \
    mongodb \
    mysqli \
    pgsql \
    soap \
    sockets \
    zip \
    maxminddb \
    memcached \
    opcache \
    pcntl \
    && rm -rf /var/lib/apt/lists/* \
    && adduser --disabled-password --home /home/container container

RUN install-php-extensions pdo_mysql \
    && chown -R container:container /config/caddy /data/caddy /usr/local/bin/frankenphp

ENV PHP_INI_SCAN_DIR=/usr/local/etc/php/conf.d:/home/container/php/conf.d
ENV XDG_CONFIG_HOME=/home/container/caddy/config
ENV XDG_DATA_HOME=/home/container/caddy/data

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER container
ENV USER=container HOME=/home/container

WORKDIR /home/container

CMD ["/entrypoint.sh"]