# FROM debian:bookworm

# RUN apt-get update && apt-get install -y \
#     nginx \
#     ca-certificates \
#     curl \
#     apt-transport-https \
#     && apt-get clean

# COPY nginx.conf /etc/nginx/nginx.conf

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]

# docker/nginx/Dockerfile
FROM nginx

ADD default.conf /etc/nginx/conf.d/default.conf
