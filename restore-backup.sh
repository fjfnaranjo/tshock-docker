#!/bin/sh

# chdir to script directory
cd "$(dirname "$0")"

# Format tShock prefix
if [ "${TSHOCK_VOL_PREFIX}" != "" ]; then
	tshock_vol_prefix=$TSHOCK_VOL_PREFIX-
else
	tshock_vol_prefix=""
fi

# Check if backup exists
if [ "$#" -ne 1 ]
then
	echo "Backup wasn't specified."
	echo "Available backups:"
	ls backups/
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
	-v ${tshock_vol_prefix}config:/tshock/config \
	-v ${tshock_vol_prefix}world:/tshock/world \
	-v ${tshock_vol_prefix}log:/tshock/log \
	fjfnaranjo/tshock:4.3.26 \
	bash -c "rm -rf /tshock/{config,log,world}/* && cp -a /host/backups/$1/. /tshock/"
