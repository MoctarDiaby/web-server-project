FROM wordpress:latest

# Copie le fichier de configuration personnalisé
COPY wp-config.php /var/www/html/wp-config.php

# Change les permissions
RUN chown -R www-data:www-data /var/www/html/wp-config.php

# Expose le port 80
EXPOSE 80
