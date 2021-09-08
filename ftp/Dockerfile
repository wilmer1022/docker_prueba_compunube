FROM ubuntu:latest

MAINTAINER wilmer1022 <guarind487@gmail.com>
RUN apt-get update && \
				apt-get install -y --no-install-recommends vsftpd db-util && \
				apt-get clean

ENV FTP_USER admin
ENV FTP_PASS admin
COPY vsftpd.conf /etc/vsftpd/
RUN mkdir -p /var/run/vsftpd/empty
RUN mkdir -p /honme/vsftpd
RUN chown -R ftp:ftp /home/vsftpd 
EXPOSE 20 21
VOLUME ["/home/vsftpd"]
VOLUME ["/var/log/vsftpd"]
CMD /usr/sbin/vsftpd