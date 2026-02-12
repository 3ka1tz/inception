FROM debian:oldstable

RUN apt-get update && \
    apt-get install -y --no-install-recommends nginx openssl && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /etc/nginx

COPY tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT ["entrypoint.sh"]
