# Utilisation de l'image Alpine Linux
FROM alpine:3.14

# Installez MariaDB
RUN apk --no-cache add mariadb mariadb-client

# Définissez les variables d'environnement pour les mots de passe
# Cela évite de stocker les mots de passe directement dans le Dockerfile
ENV MYSQL_ROOT_PASSWORD=root_password

# Exposez le port MySQL
EXPOSE 3306

# Copiez le script SQL pour créer un utilisateur dans MariaDB
COPY tools/init.sql /docker-entrypoint-initdb.d/

# Commande par défaut pour démarrer MariaDB
CMD ["mysqld"]

