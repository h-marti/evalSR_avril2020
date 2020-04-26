#!/bin/bash

echo "[*] Hostname : $(cat /var/lib/tor/hidden_service/hostname)"

echo ""

apache2ctl -D FOREGROUND
