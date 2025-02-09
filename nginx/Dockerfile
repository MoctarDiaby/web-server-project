# Utiliser l'image officielle de Nginx
FROM nginx:latest

# Installer iputils-ping et autres outils nécessaires
RUN apt-get update && apt-get install -y iputils-ping curl

# Copier la configuration personnalisée de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Exposer le port 80
EXPOSE 80
