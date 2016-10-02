FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y nginx nano
RUN mkdir /code && chmod -R 755 /code

ADD nginx.conf /etc/nginx/
COPY index.html /www/index.html
RUN chmod +x /www/index.html
ADD test.sh /code/

EXPOSE 80

VOLUME /www

CMD /usr/sbin/nginx
RUN /code/test.sh
