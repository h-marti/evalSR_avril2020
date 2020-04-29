FROM debian

RUN apt-get update -y && \
        apt-get install -y \
                apache2 \
                php \
                php-common \
                libapache2-mod-php \
                php-cli \
                php-mysql \
                php-curl \
                tor

#Stop apache2
RUN apache2ctl stop
#Ajout config perso
COPY app.conf /etc/apache2/sites-available/app.conf
#Desactivation defaut
RUN a2dissite 000-default.conf
RUN rm -rf /var/www/html/index.html
#Activation perso
RUN a2ensite app.conf

#Config tor
RUN rm -f /etc/tor/torrc
COPY torrc /etc/tor/

#Copie script execution
COPY start.sh /tmp/start.sh

#Execution
CMD ["bash","/tmp/start.sh"]
