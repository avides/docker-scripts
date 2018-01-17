#!/bin/bash

####
##
## Scale all services to 1
##      curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-replica-start.sh | bash
##
## Scale all services to previous number
##      curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-replica-start.sh | bash
##
####


## Read from stdin
input=`cat`

if [ -z "$input" ];
then

        echo "no stdin"

else

        ## Iterate over each service-line
        for serviceReplicas in $input
        do
                ## Scale replica
                echo "docker service scale $serviceReplicas"
                docker service scale $serviceReplicas
                echo ""
        done

fi
