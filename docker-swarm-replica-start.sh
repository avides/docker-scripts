#!/bin/bash

####
##
## Restore previous replica-size from backup (backup.txt)
##      curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-replica-start.sh && cat backup.txt | bash docker-swarm-replica-start.sh
##
####


## Read from stdin
input=`cat`

## Iterate over each service-line
for serviceReplicas in $input
do
        ## Scale replica
        echo "docker service scale $serviceReplicas"
        docker service scale $serviceReplicas
        echo ""
done
