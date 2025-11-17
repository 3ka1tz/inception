FROM debian:bookworm

RUN apt-get update && apt-get install -y \
    php8.2-fpm \
    php8.2-mysql \
    curl \
    && rm -rf /var/lib/apt/lists/*

CMD ["/usr/sbin/php-fpm8.2", "-F"]
