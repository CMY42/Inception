-- Créer la base de données WordPress
CREATE DATABASE IF NOT EXISTS wordpress;

-- Créer un utilisateur 'wp_user' avec le mot de passe 'wp_password'
CREATE USER 'wp_user'@'%' IDENTIFIED BY 'wp_password';

-- Accorder tous les privilèges à l'utilisateur 'wp_user' sur la base de données WordPress
GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_user'@'%';

-- Appliquer les changements de privilèges
FLUSH PRIVILEGES;
