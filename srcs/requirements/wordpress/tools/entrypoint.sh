#!/bin/bash
set -e

WP_PATH="/var/www/html"

cd "$WP_PATH"

echo "Starting WordPress entrypoint..."

if [ -f ./wp-config.php ]; then
    echo "WordPress already exists. Skipping installation."
else
    echo "Installing WordPress..."

    wp config create \
        --dbname="${WORDPRESS_DB_NAME}" \
        --dbuser="${WORDPRESS_DB_USER}" \
        --dbpass="${WORDPRESS_DB_PASS}" \
        --dbhost="${WORDPRESS_DB_HOST}" \
        --skip-check \
        --force

    wp core install \
        --url="${WORDPRESS_URL}" \
        --title="${WORDPRESS_TITLE}" \
        --admin_user="${WORDPRESS_ADMIN_USER}" \
        --admin_pass="${WORDPRESS_ADMIN_PASS}" \
        --admin_email="${WORDPRESS_ADMIN_EMAIL}"
    
    echo "WordPress installation completed."
fi

wp core update-db

echo "WordPress is ready."

exec "$@"
