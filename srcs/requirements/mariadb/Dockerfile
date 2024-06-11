# Utilisation de l'image Alpine Linux
FROM alpine:3.14

# Installez MariaDB
RUN apk --no-cache add mariadb mariadb-client

# Créez un utilisateur pour MariaDB
RUN addgroup -S mariadb && adduser -S -G mariadb mariadb

# Créez les répertoires nécessaires et changez le propriétaire des répertoires de MariaDB
RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
    chown -R mariadb:mariadb /var/lib/mysql /var/run/mysqld

# Exposez le port MySQL
EXPOSE 3306

# Copiez le script SQL pour créer un utilisateur dans MariaDB
COPY tools/init.sql /docker-entrypoint-initdb.d/

# Définissez le point d'entrée pour MariaDB
CMD ["mysqld", "--user=mariadb"]
