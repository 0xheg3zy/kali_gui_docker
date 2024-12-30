FROM kalilinux/kali-rolling
EXPOSE 80
EXPOSE 5901
COPY entrypoint.sh /entrypoint.sh
COPY self.pem /self.pem
RUN chmod +x /entrypoint.sh
RUN apt update && apt install xfce4 novnc x11vnc tightvncserver screen git dbus-x11 x11-utils burpsuite konsole -y
ENTRYPOINT ["/entrypoint.sh"]
