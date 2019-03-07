#!/bin/bash

####
## 
##  Reschedules all services where the number of running replicas does not match the number of expected replicas
## 	curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-reschedule-required.sh | bash
##
####


## Iterate over all services
docker service ls | while IFS= read -r line ; do

	## Parse service information
	name=$(echo $line | awk '{print $2;}' )
	replicas=$(echo $line | awk '{print $4}');

	## Ignore first line
	if [ "$name" == "NAME" ]; then continue; fi

	## Parse replica information
	replicasRunning=$(echo $replicas | awk -F '/' '{print $1}');
	replicasExpected=$(echo $replicas | awk -F '/' '{print $2}');

	## Execute "docker service update" for uncomplete services
	if [ "$replicasRunning" -ne "$replicasExpected" ]; then

		echo "$name - $replicasRunning/$replicasExpected";
		docker service update --force $name --with-registry-auth;

	fi

done
