#!/bin/bash

####
##
## Scales all service-replicas to 0
## 	curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-replica-stop.sh | bash
##
####


## Iterate over each service
docker service ls | while IFS= read -r line ; do

	## Parse service information
	name=$(echo $line | awk '{print $2;}' )

	## Ignore first line (header)
	if [ "$name" == "NAME" ]; then continue; fi

	## Stop all replicas
	echo "docker service scale -d $name=0"
	docker service scale -d $name=0
	echo ""
done
