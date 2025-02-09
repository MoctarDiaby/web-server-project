FROM wordpress:latest

# Ajouter le dépôt de Sury pour PHP 8.2
RUN apt-get update && apt-get install -y \
    lsb-release \
    ca-certificates \
    curl \
    apt-transport-https \
    software-properties-common \
    && curl -fsSL https://packages.sury.org/php/apt.gpg | tee /etc/apt/trusted.gpg.d/php.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list \
    && apt-get update

# Installer PHP 8.2 et les extensions nécessaires
RUN apt-get install -y \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-cli \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-xml \
    php8.2-curl \
    php8.2-zip \
    && apt-get clean
