# Utilisation de l'image Alpine Linux
FROM alpine:3.14

# Installation de NGINX
RUN apk --no-cache add nginx

# Copie des fichiers de configuration NGINX
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY certs/ /etc/nginx/certs/

# Exposition du port 443 pour HTTPS
EXPOSE 443

# Commande par défaut pour démarrer NGINX
CMD ["nginx", "-g", "daemon off;"]
