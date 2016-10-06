FROM nfqsolutions/centos:7

MAINTAINER solutions@nfq.com

# Script de arranque
COPY keepassx.sh /solutions/
RUN chmod 777 /solutions/keepassx.sh && \
	chmod a+x /solutions/keepassx.sh && \
	sed -i -e 's/\r$//' /solutions/keepassx.sh

# Volumenes para el tomcat
VOLUME /solutions/app

# Puerto de salida del tomcat
EXPOSE 22

# Configuracion supervisor
COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord"]
