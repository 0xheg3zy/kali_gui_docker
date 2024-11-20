#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout novnc-selfsigned.key -out novnc-selfsigned.crt

cat novnc-selfsigned.key novnc-selfsigned.crt > self.pem

docker build -t kali_hunter .

docker run -d -p 80:80 --name kali_hunt_box kali_hunter
