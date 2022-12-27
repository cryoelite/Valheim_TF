#!/bin/bash

export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
bash /usr/games/steamcmd +login anonymous +force_install_dir /home/Valheim +app_update 896660 +quit

/home/Valheim/valheim_server.x86_64 -name "For Misty Valheim" -port 2456 -world "Dedicated" -password "SHAME213" -public 1 -crossplay > /dev/null &

export LD_LIBRARY_PATH=$templdpath

echo "Server started"
echo  ""

while :
do
TIMESTAMP=$(date  '+%Y-%m-%d %H:%M:%S')
echo  "valheim.service: timestamp ${TIMESTAMP} "
sleep 60
done