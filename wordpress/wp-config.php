<?php
define('DB_NAME', 'wordpress');
define('DB_USER', 'user');
define('DB_PASSWORD', 'password');
define('DB_HOST', 'db'); // "db" est le nom du service MySQL dans docker-compose.yml

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
