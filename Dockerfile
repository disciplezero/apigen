FROM vfac/envdevphpbase:7.1
LABEL maintainer="Vincent Faliès <vincent@vfac.fr>"

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

RUN composer global require roave/better-reflection:dev-master#c87d856
RUN composer global require apigen/apigen:dev-master

COPY php.ini /usr/local/etc/php/php.ini

ENTRYPOINT ["/root/.composer/vendor/bin/apigen"]
