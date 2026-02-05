FROM debian:oldstable

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    rm -rf /var/lib/apt/lists/*

COPY tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["/entrypoint.sh"]
