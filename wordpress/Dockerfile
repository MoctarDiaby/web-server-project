# Utiliser une image de base avec PHP et FPM
FROM php:8.2-fpm

# Installer les extensions PHP nécessaires
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql

# Télécharger et installer WordPress
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp

# Définir le répertoire de travail
WORKDIR /var/www/html

# Copier les fichiers de WordPress si nécessaire
# COPY ./wp-content /var/www/html/wp-content/

# Exposer le port utilisé par PHP-FPM
EXPOSE 9000

CMD ["php-fpm"]
