FROM alpine:3.14

# Installer les dépendances
RUN apk --no-cache add php7 php7-fpm php7-mysqli php7-json php7-openssl php7-curl php7-zlib php7-xml php7-phar php7-intl php7-dom php7-xmlreader php7-ctype php7-session curl

# Copier les fichiers de configuration
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

# Télécharger et installer WordPress
RUN mkdir -p /var/www/html && \
    curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz -C /var/www/html --strip-components=1 && \
    rm wordpress.tar.gz

# Créer le répertoire pour le PID de PHP-FPM
RUN mkdir -p /run/php && chown -R nobody:nobody /run/php

# Ajuster les permissions
RUN chown -R nobody:nobody /var/www/html

# Exposer le port 9000
EXPOSE 9000

# Commande pour démarrer PHP-FPM
CMD ["php-fpm7", "-F"]
