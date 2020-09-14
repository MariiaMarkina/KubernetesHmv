FROM ubuntu:20.04
MAINTAINER mariia markina <MariaMarkinaV@gmail.com>
RUN groupadd userapp && useradd --uid 2000 -g userapp -s /bin/bash -d / -m  --no-log-init userapp && echo "userapp:1111111" | chpasswd
RUN apt-get update -y && apt-get upgrade -y && apt-get install openjdk-11-jdk -y && apt-get -y install wget && apt-get -y install sudo 
COPY ./nginx.conf /etc/nginx/nginx.conf
# RUN chown -R unginx:unginx /etc/nginx && chmod -R g+w /etc/nginx && chown -R unginx:unginx /var/cache && chmod -R g+w /var/cache && chown -R unginx:unginx /var/log/nginx && chmod -R g+w /var/log/nginx
# RUN chown -R unginx:unginx /var/lib/nginx && chmod -R g+w /var/lib/nginx && chown -R unginx:unginx /run && chmod -R g+w /run
USER 2000
ENTRYPOINT serve -s build
