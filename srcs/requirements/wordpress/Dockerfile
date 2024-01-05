# SPECIFIE LA DISTRIBUTION
FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y 

# UDPATE & INSTALLATION
RUN apt install unzip php7.4 curl wget redis php7.4-redis php7.4-mysqli php7.4-fpm php7.4-cgi php7.4-curl php7.4-gd php7.4-mbstring php7.4-xml php7.4-xmlrpc php7.4-soap php7.4-intl php7.4-zip -y
RUN apt install mariadb-client -y
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
RUN mkdir /run/php

# FOR DEBUGIN
RUN apt install iputils-ping -y
RUN apt install vim -y


# FOR WORDPRESS
COPY ./tools/install.sh /home/
RUN chmod 777 /home/install.sh

EXPOSE 9000

ENTRYPOINT ["/home/install.sh" ] 