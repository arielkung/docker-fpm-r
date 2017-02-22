FROM php:fpm

RUN apt-get update && \
    apt-get install -y \
    gdebi-core \
    pandoc \
    pandoc-citeproc \
    libc-dev \
    libc6-dev \
    libcurl4-gnutls-dev \
    libexpat1-dev \
    libglib2.0-dev \
    libicu-dev \
    libpcre3-dev \
    libxml2 \
    libxml2-dev \
    libxt-dev \
    libz-dev \
    xml2 \
    zlib1g-dev \
    r-base 
  
# PDO
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql

# Cleanup
RUN apt-get clean
RUN rm -fr /usr/src/php/ext

# R packages
RUN R -e "install.packages(c('rjson', 'klaR', 'stringi'), repos='http://cran.rstudio.com/')"
