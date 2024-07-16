#!/bin/sh

# Fonction pour attendre que la base de données soit prête
wait_for_db() {
    echo "Waiting for MariaDB to be ready..."
    until mysqladmin ping -h"$DB_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" --silent; do
        sleep 1
    done
    echo "MariaDB is ready!"
}

# Appeler la fonction d'attente
wait_for_db

# Démarrer PHP-FPM
echo "Starting PHP-FPM..."
exec php-fpm7 -F
