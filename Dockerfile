FROM php:8.0-apache
WORKDIR /var/www/html
RUN apt-get update && \
    apt-get clean
COPY index.php index.php
EXPOSE 80