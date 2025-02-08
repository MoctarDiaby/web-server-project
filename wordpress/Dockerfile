FROM wordpress:latest

# Copie le fichier de configuration personnalisé
RUN cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Change les permissions
RUN chown -R www-data:www-data /var/www/html/wp-config.php

# Expose le port 80
EXPOSE 80
