FROM debian:oldstable

RUN apt-get update && \
    apt-get install -y php-fpm php-mysql curl tar && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN apt-get update && \
    apt-get install -y php-fpm php-mysql curl tar default-mysql-client && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www && \
    curl -o /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf /tmp/wordpress.tar.gz -C /var/www && \
    rm /tmp/wordpress.tar.gz

RUN chown -R www-data:www-data /var/www/wordpress

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY tools/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]
