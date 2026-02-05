#!/bin/bash
set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadb-install-db --user=mysql --ldata=/var/lib/mysql
fi

mysqld_safe --skip-networking &
echo "Waiting for MariaDB to start..."

until mysqladmin ping --silent; do
    sleep 1
done

if [ ! -f "/var/lib/mysql/.db_initialized" ]; then
    echo "Running initial database setup..."

    cat << EOF > /tmp/init.sql
CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOF

    mysql < /tmp/init.sql
    touch /var/lib/mysql/.db_initialized
fi

mysqladmin -u root --password="$MYSQL_ROOT_PASSWORD" shutdown

exec mysqld
