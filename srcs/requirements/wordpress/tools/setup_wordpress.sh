#!/bin/sh

# Télécharger WordPress
wp core download --path=/var/www/html

# Créer le fichier de configuration de WordPress
cat << EOF > /var/www/html/wp-config.php
<?php
define( 'DB_NAME', getenv('MYSQL_DATABASE') );
define( 'DB_USER', getenv('MYSQL_USER') );
define( 'DB_PASSWORD', getenv('MYSQL_PASSWORD') );
define( 'DB_HOST', 'mariadb' );  // Utilisation du nom du service dans Docker Compose
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );

\$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
EOF

# Ajustement des permissions avec www-data
chown -R www-data:www-data /var/www/html /run/php/
chmod -R 755 /var/www/html
