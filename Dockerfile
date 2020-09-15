FROM ubuntu
MAINTAINER mariia markina <MariaMarkinaV@gmail.com>
RUN apt-get update && apt-get install nginx -y 
COPY ./build/* /var/www/html/
CMD ["nginx", "-g", "daemon off;"]
