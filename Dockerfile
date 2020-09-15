FROM ubuntu
MAINTAINER mariia markina <MariaMarkinaV@gmail.com>
RUN apt-get -y apache2
COPY ./build/* /var/www/html
CMD ["apache2", "-g", "daemon off;"]
