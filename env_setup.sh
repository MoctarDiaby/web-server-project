#/usr/bin/

echo "remove installed env ..........................."
docker-compose down -v
echo "remove wordpress:latest image ..........................."
docker rmi wordpress:latest
echo "update scripts..........................."
git pull
echo "Install env ..........................."
docker-compose up -d --build
echo "Check env ..........................."
docker ps
