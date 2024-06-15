#!/bin/sh

# Initialiser la base de données si nécessaire
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing database..."
    mysql_install_db --user=mysql --ldata=/var/lib/mysql
    # Démarrer MariaDB en arrière-plan pour exécuter les scripts d'initialisation
    mysqld --user=mysql --skip-networking &
    mysql_pid=$!

    # Attendre que MariaDB soit prêt
    while ! mysqladmin ping --silent; do
        sleep 1
    done

    echo "Running init.sql script..."
    # Exécuter les scripts d'initialisation
    mysql -u root < /docker-entrypoint-initdb.d/init.sql

    echo "Shutting down initialization server..."
    # Arrêter MariaDB
    mysqladmin shutdown -uroot

    # Supprimer le PID du processus MySQL
    rm -f /var/run/mysqld/mysqld.pid
fi

# Démarrer MariaDB en mode foreground
exec mysqld --user=mysql --console
