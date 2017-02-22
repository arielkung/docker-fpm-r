FROM arielkung/fpm-r

# This section is only needed for development
RUN set -xe \
  && apt-get update && \
  && apt-get install -y wget \
  && wget https://pecl.php.net/get/xdebug \
  && tar -xf xdebug \
  && mkdir -p /usr/src/php/ext \
  && mv xdebug-* /usr/src/php/ext/xdebug \
  && docker-php-ext-install xdebug \
  && apt-get remove -y wget

# Cleanup
RUN apt-get clean
