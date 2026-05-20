FROM php:8.5-fpm-alpine

RUN apk add --no-cache \
    git curl unzip postgresql-dev icu-dev rabbitmq-c-dev zlib-dev openssl-dev $PHPIZE_DEPS \
    && docker-php-ext-install pdo pdo_pgsql intl \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && pecl install amqp \
    && docker-php-ext-enable amqp \
    && apk del $PHPIZE_DEPS

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

EXPOSE 9000
