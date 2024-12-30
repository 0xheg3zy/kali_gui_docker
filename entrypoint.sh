#!/bin/bash
mkdir -p ~/.vnc
touch ~/.vnc/passwd
chmod 700 ~/.vnc
chmod 600 ~/.vnc/passwd
echo "123123" | vncpasswd -f > ~/.vnc/passwd
export USER=root
export DISPLAY=:1
vncserver -geometry 1600x900 -depth 16 :1
git clone https://github.com/novnc/noVNC /root/noVNC
cp ~/noVNC/vnc.html ~/noVNC/index.html
cp /self.pem ~/noVNC/
x11vnc -display :1 -autoport -localhost -nopw -bg -xkb -ncache -ncache_cr -quiet -forever
~/noVNC/utils/novnc_proxy --vnc localhost:5901 --listen 80 &
clear
startxfce4
