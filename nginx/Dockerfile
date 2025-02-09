# Utiliser l'image officielle de Nginx
FROM nginx:latest

# Copier la configuration personnalisée de Nginx dans le conteneur
COPY nginx.conf /etc/nginx/nginx.conf

# Copier les fichiers WordPress depuis le volume partagé
COPY ./wordpress /var/www/html

# Exposer le port 80 pour que le service Nginx soit accessible
EXPOSE 80
