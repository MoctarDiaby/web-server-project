# Utiliser l'image officielle de Nginx
FROM nginx:latest

# Mettre à jour les paquets et installer iputils-ping
RUN apt-get update && apt-get install -y iputils-ping curl ca-certificates && rm -rf /var/lib/apt/lists/*

# Copier la configuration personnalisée de Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Exposer le port 80
EXPOSE 80
