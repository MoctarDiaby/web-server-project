# Use the Bitnami WordPress image as the base
FROM bitnami/wordpress:6.3.1
 
# Install additional PHP extensions if needed
RUN install_packages php7.4-zip php7.4-mbstring
 
# Copy custom wp-content (if not using volume mapping)
# COPY ./wp-content /bitnami/wordpress/wp-content
 
# Set working directory
WORKDIR /bitnami/wordpress
 
# Expose port 8080
EXPOSE 8080
