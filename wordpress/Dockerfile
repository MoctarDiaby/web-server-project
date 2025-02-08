# Utiliser l'image officielle WordPress avec PHP 8
FROM wordpress:php8.0-fpm

# Définir le dossier de travail
WORKDIR /var/www/html

# S'assurer que les fichiers de WordPress sont bien copiés avant de modifier wp-config.php
RUN rm -rf wp-content && \
    curl -o latest.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz

# Copier le fichier wp-config.php depuis l'hôte vers le conteneur
COPY ./wp-config.php /var/www/html/wp-config.php

# Donner les bons droits aux fichiers
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

EXPOSE 9000
CMD ["php-fpm"]
