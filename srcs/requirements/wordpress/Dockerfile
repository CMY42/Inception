# Utilisation de l'image Alpine pour réduire la taille et améliorer la sécurité
FROM alpine:3.14

# Installer les dépendances nécessaires pour WordPress et PHP
RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session curl

# Installer mysql-client pour interagir avec MariaDB
RUN apk add --no-cache mysql-client

# Ajouter l'utilisateur www-data seulement s'il n'existe pas
RUN if ! getent group www-data; then addgroup -S www-data; fi && \
    if ! getent passwd www-data; then adduser -S www-data -G www-data; fi

# Installer wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Copier les fichiers de configuration PHP-FPM
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

# Copier le script WordPress
COPY tools/setup_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup_wordpress.sh

# Créer le répertoire pour PHP-FPM PID s'il n'existe pas
RUN mkdir -p /run/php/

# Créer le répertoire pour WordPress avec les bonnes permissions
RUN mkdir -p /var/www/html && \
    chown -R nobody:www-data /var/www/html /run/php/ && \
    chmod -R 755 /var/www/html

# Exposer le port 9000 (PHP-FPM)
EXPOSE 9000

# Définir le point d'entrée comme le script personnalisé
#ENTRYPOINT ["docker-entrypoint.sh"]

# Commande par défaut pour démarrer PHP-FPM
CMD ["php-fpm7", "-F"]
