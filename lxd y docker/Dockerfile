FROM ubuntu:18.04
MAINTAINER wilmer1022 <guarind487@gmail.com>
RUN apt-get update && apt-get install -y apache2 && apt-get clean
COPY index.html /var/www/html/
EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]