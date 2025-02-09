# Utiliser l'image officielle de WordPress
FROM wordpress:latest

# Ajouter le dépôt pour PHP 8.2
RUN apt-get update && apt-get install -y \
    lsb-release \
    ca-certificates \
    curl \
    apt-transport-https \
    && curl -fsSL https://packages.sury.org/php/README.txt | bash -x \
    && apt-get update \
    && apt-get install -y php8.2-fpm

# Exposer le port 9000 pour que Nginx puisse se connecter
EXPOSE 9000
