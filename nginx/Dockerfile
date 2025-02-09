# Utiliser une image de base Ubuntu
FROM ubuntu:22.04

# Mettre à jour les paquets et installer les dépendances
RUN apt-get update && apt-get install -y \
    lsb-release \
    ca-certificates \
    curl \
    apt-transport-https \
    software-properties-common 

# Ajouter le dépôt officiel de PHP (SURY) sans `add-apt-repository`
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list && \
    curl -fsSL https://packages.sury.org/php/apt.gpg | tee /etc/apt/trusted.gpg.d/sury-keyring.gpg > /dev/null

# Mettre à jour la liste des paquets
RUN apt-get update

# Installer PHP-FPM 8.2 et ses extensions nécessaires
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

# Exposer le port 80
EXPOSE 80

# Lancer PHP-FPM et Nginx ensemble
CMD service php8.2-fpm start && nginx -g 'daemon off;'
