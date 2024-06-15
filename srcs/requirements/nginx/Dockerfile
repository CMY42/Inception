# Utilisation de l'image Alpine Linux
FROM alpine:3.14

# Installation de NGINX et OpenSSL
RUN apk --no-cache add nginx openssl

# Création du répertoire pour les certificats
RUN mkdir -p /etc/nginx/certs

# Génération du certificat auto-signé
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/certs/nginx-selfsigned.key \
    -out /etc/nginx/certs/nginx-selfsigned.crt \
    -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=Student/CN=cmansey.42.fr"

# Créer l'utilisateur et le groupe www
RUN adduser -D -g 'www' www

# Création du répertoire pour les PID de NGINX et ajustement des permissions
RUN mkdir -p /run/nginx && \
    chown -R www:www /run/nginx

# Copie des fichiers de configuration NGINX
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Exposition du port 443 pour HTTPS
EXPOSE 443

# Commande par défaut pour démarrer NGINX
CMD ["nginx", "-g", "daemon off;"]
