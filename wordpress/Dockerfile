# Utiliser l'image officielle de WordPress
FROM wordpress:latest

# Installer PHP-FPM - requis par nginx
RUN apt-get update && apt-get install -y php-fpm

# Exposer le port 80 pour que Nginx puisse l'utiliser
EXPOSE 9000
