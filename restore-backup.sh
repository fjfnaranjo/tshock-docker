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
	exit 2
fi

# Restore volumes content
docker-compose run \
	--rm \
	--entrypoint "" \
	-v "`pwd`:/host" \
	tshock \
	cp -R "/host/backups/$1" /var/tshock

