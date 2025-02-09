# Utiliser l'image officielle de WordPress avec PHP-FPM
FROM wordpress:latest

# Si nécessaire, installe des extensions supplémentaires
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql

# Exposer le port 80 pour Nginx
EXPOSE 80
