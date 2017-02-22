FROM arielkung/fpm-r

# This section is only needed for development
RUN set -xe \
  && apt-get update \
  && wget https://pecl.php.net/get/xdebug \
  && tar -xf xdebug \
  && mkdir -p /usr/src/php/ext \
  && mv xdebug-* /usr/src/php/ext/xdebug \
  && docker-php-ext-install xdebug
  
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer

# Cleanup
RUN apt-get clean
