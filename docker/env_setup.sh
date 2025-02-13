#/usr/bin/

echo "remove installed env ..........................."
docker-compose down -v
echo "remove created image ..........................."
docker rmi wordpress:latest
docker rmi web-server-project_nginx       
docker rmi web-server-project_wordpress
docker rmi web-server-project_mariadb  
docker rmi nginx                       
docker rmi mariadb                     
docker rmi wordpress  
echo "update scripts..........................."
git pull
echo "Install env ..........................."
docker-compose up -d --build
echo "Check env ..........................."
docker ps
