FROM ubuntu
MAINTAINER mariia markina <MariaMarkinaV@gmail.com>
#RUN apt-get update && apt-get install nginx -y 
#COPY ./build/* /var/www/html/
#CMD ["nginx", "-g", "daemon off;"]
RUN apt-get update && apt install -y nodejs && apt-get install -y npm && npm install -g serve 
COPY ./build/* ./
ENTRYPOINT serve -s build
