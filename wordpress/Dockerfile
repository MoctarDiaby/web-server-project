FROM wordpress:latest

# Installe des extensions PHP nécessaires pour WordPress
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-cli \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-curl \
    php8.2-zip \
    && apt-get clean

# Exposer le port 80 pour que WordPress soit accessible
EXPOSE 80
