# SPECIFIE LA DISTRIBUTION
FROM debian:bullseye
RUN apt-get update && apt-get upgrade -y 

# UDPATE & INSTALLATION
RUN apt-get install -y iputils-ping vim vsftpd 

COPY ./conf/vsftpd.conf /etc/

COPY ./tools/script.sh /home/
RUN chmod +x /home/script.sh



ENTRYPOINT ["/home/script.sh" ] 