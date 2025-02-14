#/usr/bin/

echo "remove installed env ..........................."
docker-compose down -v
echo "remove created images ..........................."
docker rmi wordpress:latest web-server-project_nginx web-server-project_wordpress
docker rmi web-server-project_mariadb  
docker rmi nginx mariadb wordpress docker_nginx docker_mariadb docker_wordpress 
echo "update scripts..........................."
git pull
echo "Install env ..........................."
docker-compose up -d --build
echo "Check env ..........................."
docker ps
