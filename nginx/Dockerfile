# Use the official Nginx image as the base image
FROM nginx:latest

# Copy your Nginx configuration file to the container
COPY nginx.conf /etc/nginx/nginx.conf

# Create the snippets directory and add the fastcgi-php.conf file
RUN mkdir -p /etc/nginx/snippets && \
    echo 'fastcgi_split_path_info ^(.+\.php)(/.+)$;\n\
    fastcgi_index index.php;\n\
    include fastcgi_params;\n\
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;\n\
    fastcgi_param PATH_INFO $fastcgi_path_info;' > /etc/nginx/snippets/fastcgi-php.conf
# Expose port 80
EXPOSE 80

# Command to run Nginx
CMD ["nginx", "-g", "daemon off;"]






# --------------------- my -----------------
# FROM nginx

# COPY nginx.conf /etc/nginx/nginx.conf

# # Expose port 80
# EXPOSE 80
