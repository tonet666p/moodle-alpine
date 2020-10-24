FROM existenz/webstack:7.3

EXPOSE 80
EXPOSE 443

RUN mkdir /moodledata && chown php:nginx /moodledata
VOLUME /moodledata/

RUN apk -U --no-cache add \
        php7 \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-pdo_mysql \
        php7-ssh2 \
        php7-zip \
        npm

RUN rm /www/public/index.php
COPY --chown=php:nginx moodle-master /www/public/

RUN find /www -type d -exec chmod -R 555 {} \; \
    && find /www -type f -exec chmod -R 444 {} \;
