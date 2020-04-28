#!/bin/bash

tor --RunAsDaemon 1

echo "[*] Hostname : $(cat /var/lib/tor/hidden_service/hostname)"

echo ""

apache2ctl -D FOREGROUND
