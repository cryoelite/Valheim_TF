#!/bin/bash
BACKUP_FILE=$1
TOKEN=$2

response=$(curl -s https://api.gofile.io/getServer)

# Use jq to extract the value of the "server" key
server=$(echo $response | jq -r '.data.server')

# Concatenate the server value with the URL
url= "https://"$server".gofile.io/uploadFile"

# Make the second request using the full URL
curl -F file=@$1 -F "folderId=bbde88d5-dd53-4a2e-955a-6457701037d8" -F "token=$2" 