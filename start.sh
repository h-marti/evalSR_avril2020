#!/bin/bash

#Execution hidden service
tor --RunAsDaemon 1

echo " "
echo "[*] Hostname : $(cat /var/lib/tor/hidden_service/hostname)"
echo " "

#Lancement apache
apache2ctl -D FOREGROUND