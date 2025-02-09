# Utiliser une image Ubuntu de base
FROM ubuntu:22.04

# Mettre à jour les dépôts et installer les outils nécessaires
RUN apt-get update && apt-get install -y \
    lsb-release \
    ca-certificates \
    curl \
    apt-transport-https \
    software-properties-common

# Ajouter le dépôt de Ondřej Surý pour PHP
RUN curl -fsSL https://packages.sury.org/php/README.txt | bash -x

# Mettre à jour les paquets
RUN apt-get update

# Installer Nginx et PHP 8.2
RUN apt-get install -y \
    nginx \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-cli \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-curl \
    php8.2-zip

# Copier le fichier de configuration Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Exposer le port 80 pour Nginx
EXPOSE 80

# Lancer Nginx et PHP-FPM dans le même conteneur
CMD service php8.2-fpm start && nginx -g 'daemon off;'
