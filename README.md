Docker-Scripts
==============

## Reschedule all services
```bash
curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-reschedule.sh | bash
```

## Replica-size backup
```bash
curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-replica-backup.sh | bash > backup.txt
```

## Scale all replicas to 0
```bash
curl -sSL https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-replica-stop.sh | bash
```

## Restore replica-size
```bash
curl -O https://raw.githubusercontent.com/avides/docker-scripts/master/docker-swarm-replica-start.sh && cat backup.txt | bash docker-swarm-replica-start.sh
```
