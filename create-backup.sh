#!/bin/sh

# chdir to script directory
cd "$(dirname "$0")"

# Ensure tShock service image and volumes
docker-compose up --no-start

# Stop the service
docker-compose stop

# Ensure backups folder
mkdir -p backups

# Backup volumes content
docker-compose run \
	--rm \
	--entrypoint "" \
	-v "`pwd`:/host" \
	tshock \
	cp -R /var/tshock /host/backups/`date -u +'%Y-%m-%d-%H-%M-%S'`

