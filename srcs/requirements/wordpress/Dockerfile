# Utilisation de l'image Alpine Linux
FROM alpine:3.14

# Installation de WordPress, php-fpm et les extensions PHP nécessaires
RUN apk --no-cache add \
	wordpress \
	php7 \
	php7-fpm \
	php7-mysqli \
	php7-json \
	php7-openssl \
	php7-curl \
	php7-zlib \
	php7-xml \
	php7-phar \
	php7-intl \
	php7-dom \
	php7-xmlreader \
	php7-ctype \
	php7-mbstring \
	php7-gd \
	php7-simplexml \
	php7-tokenizer \
	php7-xmlwriter \
	php7-session \
	php7-fileinfo \
	php7-iconv

# Configuration de php-fpm (ajustez selon les recommandations de WordPress)
COPY conf/php-fpm.conf /etc/php7/php-fpm.conf
COPY conf/www.conf /etc/php7/php-fpm.d/www.conf

# Exposez le port 9000 pour php-fpm
EXPOSE 9000

# Commande par défaut pour démarrer php-fpm
CMD ["php-fpm7", "-F"]
