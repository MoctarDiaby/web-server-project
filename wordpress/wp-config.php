<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'user');
define('DB_PASSWORD', 'password');
define('DB_HOST', 'db'); // "db" est le nom du service MySQL dans docker-compose.yml

define('WP_ALLOW_MULTISITE', true);
define('MULTISITE', true);
define('SUBDOMAIN_INSTALL', false);

// Clés de sécurité (à générer via https://api.wordpress.org/secret-key/1.1/salt/)
define('AUTH_KEY',         'your-random-key');
define('SECURE_AUTH_KEY',  'your-random-key');
define('LOGGED_IN_KEY',    'your-random-key');
define('NONCE_KEY',        'your-random-key');
define('AUTH_SALT',        'your-random-key');
define('SECURE_AUTH_SALT', 'your-random-key');
define('LOGGED_IN_SALT',   'your-random-key');
define('NONCE_SALT',       'your-random-key');

define('WP_HOME', 'http://localhost:8080');
define('WP_SITEURL', 'http://localhost:8080');


$table_prefix = 'wp_';

// define('WP_DEBUG', false);
define('WP_DEBUG', true);
define('WP_DEBUG_LOG', true);
define('WP_DEBUG_DISPLAY', false);

if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

require_once ABSPATH . 'wp-settings.php';
