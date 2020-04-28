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

#Ajout fichier verification configuration
RUN rm -rf /var/www/html/index.html
RUN echo "<?php phpinfo() ?>" > /var/www/html/index.php

#Config tor
RUN rm -f /etc/tor/torrc
COPY torrc /etc/tor/

#Copie script execution
COPY start.sh /tmp/start.sh

#Execution
CMD ["bash","/tmp/start.sh"]
