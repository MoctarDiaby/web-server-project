FROM wordpress:latest

# Installation des dépendances PHP
RUN apt-get update && apt-get install -y \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-cli \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-curl \
    php8.2-zip \
    && apt-get clean

# Définition de la commande d'entrée pour démarrer PHP-FPM
CMD ["php-fpm8.2", "-F"]
