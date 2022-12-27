# escape=`
FROM ubuntu:22.10
LABEL "Author"="cryonim"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install software-properties-common -y
#RUN reboot
RUN dpkg --add-architecture i386
RUN add-apt-repository multiverse -y
RUN apt-get update
RUN apt-get dist-upgrade -y
#RUN reboot
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install nano -y
#RUN apt-get install lib32gcc-s1 steamcmd -y


#RUN useradd -m steam
#RUN mkdir -p /etc/sudoers.d 
#RUN echo "steam ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/steam 
#RUN chmod 0440 /etc/sudoers.d/steam
#RUN echo "steam:Steam" | chpasswd
#RUN apt-get install steamcmd -y
RUN echo "2" | apt-get install lib32gcc-s1 steamcmd -y
#USER steam
RUN cd /home/
RUN mkdir Valheim
RUN bash /usr/games/steamcmd +login anonymous +force_install_dir /home/Valheim +app_update 896660 validate +exit
COPY ["start_Valheim.sh", "/home/Valheim/"]
#RUN systemctl daemon-reload
#RUN systemctl start valheim
#RUN systemctl enable valheim
#RUN systemctl status valheim

EXPOSE 2456
EXPOSE 2457
EXPOSE 2458


#RUN cd ~/
#RUN mkdir Valheim && cd Valheim