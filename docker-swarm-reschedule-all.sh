#!/bin/bash

####
## 
##  Reschedules all services
## 	curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-reschedule-all.sh | bash
##
####


## Iterate over all services
docker service ls | while IFS= read -r line ; do

	## Parse service information
	name=$(echo $line | awk '{print $2;}' )
	replicas=$(echo $line | awk '{print $4}');

	## Ignore first line
	if [ "$name" == "NAME" ]; then continue; fi

	echo "$name - $replicasRunning/$replicasExpected";
	docker service update --force $name --with-registry-auth;

done
