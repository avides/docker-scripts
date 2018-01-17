#!/bin/bash

####
## 
## Stream service-backup to stdout
## 	curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-replica-backup.sh | bash
##
## Stream service backup to file
##	curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-replica-backup.sh | bash > backup.txt
##	cat backup.txt
####


docker service ls | while IFS= read -r line ; do

	## Parse service information
	name=$(echo $line | awk '{print $2;}' )
	replicas=$(echo $line | awk '{print $4}');

	## Ignore first line
	if [ "$name" == "NAME" ]; then continue; fi

	## Parse replica information
	replicasExpected=$(echo $replicas | awk -F '/' '{print $2}');

	## Print current state
	echo "$name=$replicasExpected"

done
