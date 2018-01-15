#!/bin/bash

####
## Execute "curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-replica-start.sh | bash"
####


input=`cat`

for serviceReplicas in $input
do
        echo "docker service scale $serviceReplicas"
        docker service scale $serviceReplicas
        echo ""
done
