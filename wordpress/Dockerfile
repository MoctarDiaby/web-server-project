FROM php:8.2-fpm

# Installer les dépendances et les extensions PHP nécessaires
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql \
    && apt-get clean

# Copier les fichiers WordPress dans le conteneur
COPY . /var/www/html

# Changer les permissions
RUN chown -R www-data:www-data /var/www/html

# Exposer le port 9000 pour PHP-FPM
EXPOSE 9000

# Lancer PHP-FPM
CMD ["php-fpm"]
