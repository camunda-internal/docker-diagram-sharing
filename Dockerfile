FROM ubuntu:14.04.2

ENV DEBIAN_FRONTEND=noninteractive \
    INITRD=No

# set timezone
RUN ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# add helper scripts
ADD bin/* /usr/local/bin/
RUN chmod -R +x /usr/local/bin/

# fix vi mode
RUN sed -i 's/set compatible/set nocompatible/' /usr/share/vim/vimrc.tiny

# install packages
RUN install-packages.sh git wget curl zip unzip sudo ca-certificates nano lighttpd php5-cgi

ADD conf/lighttpd.conf /etc/lighttpd/lighttpd.conf

RUN mkdir -p /var/cache/lighttpd/compress/

RUN rm -R /var/www && \
	git clone https://github.com/camunda-internal/camunda-diagram-sharing.git /var/www && \
	mkdir -p /var/www/users && \
    chmod -R 777 /var/www/users && \
	chown -R www-data:www-data /var/www
	

WORKDIR /var/www/
EXPOSE 80

CMD ["start.sh"]


