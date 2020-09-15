FROM ubuntu
MAINTAINER mariia markina <MariaMarkinaV@gmail.com>
RUN apt-get install -y apache
COPY ./build/* /var/www/html
CMD ["apache", "-g", "daemon off;"]
