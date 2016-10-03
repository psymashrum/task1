FROM ubuntu:trusty

ARG GIT=git@github.com:psymashrum/task1.git
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y nginx wget git curl
RUN mkdir /code && chmod -R 755 /code
RUN cd /code && git clone $GIT
ADD nginx.conf /etc/nginx/
RUN cp ./nginx.conf /etc/nginx/
RUN cp ./index.html /www/index.html
RUN chmod +x /www/index.html

EXPOSE 80

VOLUME /www

CMD /usr/sbin/nginx
RUN /code/test.sh
RUN curl 127.0.0.1:80
