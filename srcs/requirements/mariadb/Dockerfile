# Utilisation d'une image Alpine pour réduire la taille et améliorer la sécurité
FROM alpine:3.14

# Installer MariaDB et le client MariaDB
RUN apk --no-cache add mariadb mariadb-client

# Créer les répertoires nécessaires et ajuster les permissions
RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
    chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# Copier le script d'initialisation SQL
COPY tools/init.sql /docker-entrypoint-initdb.d/

# Copier le script de démarrage personnalisé
COPY tools/docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Exposer le port 3306 pour MariaDB
EXPOSE 3306

# Commande de démarrage de MariaDB
ENTRYPOINT ["docker-entrypoint.sh"]
