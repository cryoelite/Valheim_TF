#!/bin/bash
BACKUP_FILE=$1
FOLDERID=$2
TOKEN=$3
echo "Starting backup of config to gofile"

echo "Backup file location is $BACKUP_FILE"

response=$(curl -s https://api.gofile.io/getServer)

# Use jq to extract the value of the "server" key
server=$(echo $response | jq -r '.data.server')

# Concatenate the server value with the URL
url="https://$server.gofile.io/uploadFile"

# Make the second request using the full URL
curl -F file=@$BACKUP_FILE -F "folderId=$FOLDERID" -F "token=$TOKEN" "$url"