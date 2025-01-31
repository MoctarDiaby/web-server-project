# Base Image 
FROM nginx:last
# MAINTAINER of the Dockerfile
MAINTAINER Abdelkader BOUMEDIENE <abdelkader.boumediene@gmail.com>
#Copy the index.html file /usr/share/nginx/html/
COPY index.html /usr/share/nginx/html/
#Expose Nginx Port
EXPOSE 80
#Start NginxService 
CMD ["nginx", "-g", "daemon off;"]
