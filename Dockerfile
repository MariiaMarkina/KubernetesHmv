FROM ubuntu
MAINTAINER mariia markina <MariaMarkinaV@gmail.com>
RUN apt-get update && apt-get install nginx -y 
COPY ./build/* /usr/share/nginx/html/
CMD ["nginx", "-g", "daemon off;"]
