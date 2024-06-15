#!/bin/sh

# Télécharger WordPress
curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz

# Extraire WordPress
tar -xzf wordpress.tar.gz -C /var/www/html --strip-components=1

# Supprimer l'archive
rm wordpress.tar.gz

# Créer le fichier de configuration de WordPress
cat << EOF > /var/www/html/wp-config.php
<?php
define( 'DB_NAME', getenv('MYSQL_DATABASE') );
define( 'DB_USER', getenv('MYSQL_USER') );
define( 'DB_PASSWORD', getenv('MYSQL_PASSWORD') );
define( 'DB_HOST', getenv('WORDPRESS_DB_HOST') );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

\$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
EOF

# Ajustement des permissions
chown -R nobody:nogroup /var/www/html
