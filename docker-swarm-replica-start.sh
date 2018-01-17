#!/bin/bash

####
## Execute "curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-replica-start.sh | bash"
####


## Read from stdin
input=`cat`

## Iterate over each service-line
for serviceReplicas in $input
do
        echo "docker service scale $serviceReplicas"
        docker service scale $serviceReplicas
        echo ""
done
