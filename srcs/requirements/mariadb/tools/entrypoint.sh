#!/bin/bash
set -e

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mariadb-install-db --user=mysql --ldata=/var/lib/mysql
fi

# Start MariaDB in the background
mysqld_safe &
echo "Waiting for MariaDB to start..."

# Wait until MariaDB is ready
until mysqladmin ping --silent; do
    sleep 1
done

echo "MariaDB started."

echo "Running initial database setup..."

# Create DB and user
mariadb -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED VIA unix_socket;
FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

# Debug output
mariadb -u root -e "SELECT user, host, plugin FROM mysql.user;"


echo "Initial database setup completed."

# Shutdown MariaDB cleanly so it can restart in foreground
mysqladmin -u root --password="$MYSQL_ROOT_PASSWORD" shutdown

# Start MariaDB normally
exec mysqld
