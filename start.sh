#!/bin/sh
docker-compose build --build-arg ROOT_PS=<pass> --build-arg Linode_API=<apikey> --build-arg SERVER_PS=<serverps> --no-cache
#remove no-cache to use cache for faster build time
#docker run --name ansiblu_c -u root -ti --entrypoint /bin/sh valheim-ansiblu
#This keeps the container running but doesnt execute the dockerfile's entrypoint.
docker run --name ansiblu_c -u root -ti valheim-ansiblu
#This runs the entrypoint but will not keep the container running if it has nothing to do. 

#And to clear docker files
docker container prune -f
docker image prune -a

