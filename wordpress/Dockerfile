# Utiliser l'image officielle de WordPress
FROM wordpress:latest

# Installer PHP-FPM pour la version 8.2
RUN apt-get update && apt-get install -y php8.2-fpm

# Exposer le port 9000 pour que Nginx puisse se connecter
EXPOSE 9000
