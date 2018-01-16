FROM vfac/envdevphpbase:7.2-alpine
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN apk update \
    && apk upgrade \
    && apk add \
        openssh \
    && rm -rf /var/cache/apk/*

COPY composer.json /app/composer.json
RUN cd /app/ \
    && composer update --lock

COPY php.ini /usr/local/etc/php/php.ini

ENTRYPOINT ["/app/vendor/bin/apigen"]
