#!/bin/sh

# chdir to script directory
cd "$(dirname "$0")"

# Ensure tShock service image and volumes
docker-compose up --no-start

# Stop the service
docker-compose stop

# Check if backup exists
if [ "$#" -ne 1 ]
then
	echo "Backup wasn't specified."
	exit 1
fi
if [ ! -d "backups/$1" ]
then
	echo "Backup don't exists."
	echo "Available backups:"
	ls backups/
	exit 2
fi

# Restore volumes content
docker-compose run \
	--rm \
	--entrypoint "" \
	-v "`pwd`:/host" \
	tshock \
	cp -a "/host/backups/$1/." /var/tshock/

