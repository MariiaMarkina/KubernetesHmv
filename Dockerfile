FROM ubuntu
MAINTAINER mariia markina <MariaMarkinaV@gmail.com>
RUN apt-get update
RUN apt-get install -y apache2
COPY ./build/* /var/www/html
CMD ["apache2", "-g", "daemon off;"]
