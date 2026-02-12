#!/bin/bash
set -e

echo "Starting NGINX entrypoint..."

mkdir -p /etc/ssl/certs /etc/ssl/private

CRT=/etc/ssl/certs/nginx.crt
KEY=/etc/ssl/private/nginx.key

if [ ! -f "$CRT" ] || [ ! -f "$KEY" ]; then
    echo "Generating self-signed certificate..."

    openssl req -x509 -nodes -new -newkey rsa:2048 \
        -out "$CRT" \
        -keyout "$KEY" \
        -days 365 \
        -subj "/CN=localhost" \
        -addext "subjectAltName=DNS:localhost"

    chmod 600 "$KEY"
fi

exec nginx -g "daemon off;"
