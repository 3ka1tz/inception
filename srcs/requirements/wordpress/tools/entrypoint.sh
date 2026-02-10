#!/bin/bash
set -e

cd "/var/www/wordpress"

echo "Starting WordPress entrypoint..."

echo "Waiting for MariaDB to be ready..."
until mysqladmin ping -h"$WORDPRESS_DB_HOST" -u"$WORDPRESS_DB_USER" -p"$WORDPRESS_DB_PASSWORD" --silent; do
    echo "MariaDB is unavailable - sleeping"
    sleep 2
done
echo "MariaDB is up!"

if [ ! -f wp-load.php ]; then
    echo "Downloading WordPress..."
    wp core download --allow-root
fi

if [ ! -f ./wp-config.php ]; then
    echo "Installing WordPress..."

    wp config create --allow-root \
        --dbname="${WORDPRESS_DB_NAME}" \
        --dbuser="${WORDPRESS_DB_USER}" \
        --dbpass="${WORDPRESS_DB_PASSWORD}" \
        --dbhost="${WORDPRESS_DB_HOST}" \
        --skip-check \
        --force

    wp core install --allow-root \
        --url="${WORDPRESS_URL}" \
        --title="${WORDPRESS_TITLE}" \
        --admin_user="${WORDPRESS_ADMIN_USER}" \
        --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
        --admin_email="${WORDPRESS_ADMIN_EMAIL}"

    echo "Creating second WordPress user..."

    wp user create "${WORDPRESS_USER}" "${WORDPRESS_USER_EMAIL}" \
        --role=subscriber \
        --user_pass="${WORDPRESS_USER_PASSWORD}" \
        --allow-root
    
    echo "WordPress installation completed."
else
    echo "WordPress already exists. Skipping installation."
fi

wp core update-db --allow-root

echo "WordPress is ready."

exec "$@"
