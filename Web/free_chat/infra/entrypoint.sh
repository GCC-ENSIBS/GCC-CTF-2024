#!/bin/bash

cd /freechat
python3 -B app.py &

cd /var/www/fr33chat_d3v_right.local
python3 -B app.py 