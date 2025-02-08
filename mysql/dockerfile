FROM mysql:8

# Copie le script d'initialisation de la base
COPY init.sql /docker-entrypoint-initdb.d/

# Définit l'encodage par défaut
CMD ["mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci"]
