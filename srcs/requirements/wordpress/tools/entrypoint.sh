#!/bin/bash
set -e

WP_PATH="/var/www/wordpress"
cd "$WP_PATH"

echo "Starting WordPress entrypoint..."

echo "Waiting for MariaDB to be ready..."

until mysqladmin ping -h"$WORDPRESS_DB_HOST" --silent; do
    echo "MariaDB is unavailable - sleeping"
    sleep 2
done

echo "MariaDB is up!"

if [ ! -f wp-load.php ]; then
    echo "Downloading WordPress..."
    wp core download --allow-root
fi

if [ -f ./wp-config.php ]; then
    echo "WordPress already exists. Skipping installation."
else
    echo "Installing WordPress..."

    wp config create --allow-root \
        --dbname="${WORDPRESS_DB_NAME}" \
        --dbuser="${WORDPRESS_DB_USER}" \
        --dbpass="${WORDPRESS_DB_PASS}" \
        --dbhost="${WORDPRESS_DB_HOST}" \
        --skip-check \
        --force

    wp core install --allow-root \
        --url="${WORDPRESS_URL}" \
        --title="${WORDPRESS_TITLE}" \
        --admin_user="${WORDPRESS_ADMIN_USER}" \
        --admin_pass="${WORDPRESS_ADMIN_PASS}" \
        --admin_email="${WORDPRESS_ADMIN_EMAIL}"
    
    echo "WordPress installation completed."
fi

wp core update-db --allow-root

echo "WordPress is ready."

exec "$@"
