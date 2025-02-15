#!/bin/bash
set -e

# Variables (remplacées dynamiquement par Terraform)
DB_NAME="wordpress"
DB_USER="admin"
DB_PASSWORD="password"
DB_HOST="${module.rds.db_endpoint}"

# Installation des paquets nécessaires
apt update -y
apt install -y apache2 mysql-client php php-mysql wget unzip

# Téléchargement et configuration de WordPress
cd /var/www/html
rm -rf *
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* .
rmdir wordpress
rm latest.tar.gz

# Configuration du fichier wp-config.php
cat <<EOF > /var/www/html/wp-config.php
<?php
define( 'DB_NAME', '${DB_NAME}' );
define( 'DB_USER', '${DB_USER}' );
define( 'DB_PASSWORD', '${DB_PASSWORD}' );
define( 'DB_HOST', '${DB_HOST}' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
\$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
?>
EOF

# Permissions et redémarrage des services
chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html
systemctl restart apache2
