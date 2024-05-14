-- Crée un utilisateur 'myuser' avec le mot de passe 'mypassword'
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword';

-- Accorde tous les privilèges à l'utilisateur 'myuser' sur toutes les bases de données
GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'localhost';
