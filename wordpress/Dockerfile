# Utiliser l'image officielle de WordPress
FROM wordpress:latest

# Installer les dépendances nécessaires pour PHP 8.2 et PHP-FPM
RUN apt-get update && apt-get install -y \
    lsb-release \
    ca-certificates \
    curl \
    apt-transport-https \
    software-properties-common \
    && add-apt-repository ppa:ondrej/php \
    && apt-get update \
    && apt-get install -y php8.2-fpm

# Exposer le port 9000 pour que Nginx puisse se connecter
EXPOSE 9000
