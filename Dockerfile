FROM ubuntu
MAINTAINER mariia markina <MariaMarkinaV@gmail.com>
COPY /* /
RUN npm install -g serve
ENTRYPOINT serve -s build
