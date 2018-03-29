FROM vfac/envdevphpbase:7.2-cli-alpine
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

USER root

RUN apk update \
    && apk upgrade \
    && apk add \
        openssh \
    && rm -rf /var/cache/apk/*

COPY composer.json /app/composer.json

RUN chown -R vfac:vfac /app

USER vfac

RUN cd /app/ \
    && composer install

COPY php.ini /usr/local/etc/php/php.ini

ENTRYPOINT ["/app/vendor/bin/apigen"]
