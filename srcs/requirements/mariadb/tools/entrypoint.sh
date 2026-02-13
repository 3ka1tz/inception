#!/bin/bash
set -e

echo "Starting MariaDB entrypoint..."

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadb-install-db --user=mysql --ldata=/var/lib/mysql
fi

mysqld_safe &

echo "Waiting for MariaDB to start..."
until mysqladmin -u root -p "$MYSQL_ROOT_PASSWORD" ping --silent; do
    sleep 1
done
echo "MariaDB started."

echo "Running initial database setup..."
mysqladmin -u root password "$MYSQL_ROOT_PASSWORD" || true

mariadb -u root -p "$MYSQL_ROOT_PASSWORD" << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF
echo "Initial database setup completed."

mysqladmin -u root -p "$MYSQL_ROOT_PASSWORD" shutdown

exec mysqld
