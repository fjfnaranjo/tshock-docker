#!/bin/sh

# chdir to script directory
cd "$(dirname "$0")"

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
docker run --rm \
	-v "`pwd`:/host" \
	-v config:/tshock/config \
	-v world:/tshock/world \
	-v log:/tshock/log \
	fjfnaranjo/tshock:4.3.26 \
	cp -a "/host/backups/$1/." /tshock/
