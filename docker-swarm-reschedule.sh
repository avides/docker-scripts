#!/bin/bash

####
## Execute "curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-reschedule.sh | bash"
####


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
