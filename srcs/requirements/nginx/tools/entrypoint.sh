#!/bin/bash
set -euo pipefail

CRT=/etc/ssl/certs/nginx.crt
KEY=/etc/ssl/private/nginx.key

mkdir -p /etc/ssl/certs /etc/ssl/private

if [ ! -f "$CRT" ] || [ ! -f "$KEY" ]; then
    echo "Generating self-signed certificate..."
    openssl req -x509 -nodes -newkey rsa:2048 \
        -out "$CRT" \
        -keyout "$KEY" \
        -days 365 \
        -subj "/CN=localhost" \
        -addext "subjectAltName=DNS:localhost"
    chmod 600 "$KEY"
fi

exec nginx -g "daemon off;"
