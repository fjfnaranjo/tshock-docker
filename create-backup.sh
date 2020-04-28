#!/bin/sh

# chdir to this script directory
cd "$(dirname "$0")"

# Format tShock prefix
if [ "${TSHOCK_VOL_PREFIX}" != "" ]; then
	filtered_prefix=$(echo $TSHOCK_VOL_PREFIX | sed 's/[a-zA-Z0-9][a-zA-Z0-9_.-]*/ok/')
	if [ "${filtered_prefix}" != "ok" ]; then
		echo "Env var TSHOCK_VOL_PREFIX doesn't have a valid value"
		exit
	fi
	tshock_vol_prefix=$TSHOCK_VOL_PREFIX-
else
	tshock_vol_prefix=""
fi

# Ensure backup directory
mkdir -p backups
BACKUP_NAME=$tshock_vol_prefix`date -u +'%Y-%m-%d-%H-%M-%S'`
mkdir -p backups/$BACKUP_NAME/config
mkdir -p backups/$BACKUP_NAME/log
mkdir -p backups/$BACKUP_NAME/world

# Do backup
docker run --rm \
	-v "`pwd`:/host" \
	-v ${tshock_vol_prefix}config:/tshock/config \
	fjfnaranjo/tshock:4.3.26 \
	bash -c "cp -a /tshock/config/. /host/backups/$BACKUP_NAME/config/"
docker run --rm \
	-v "`pwd`:/host" \
	-v ${tshock_vol_prefix}log:/tshock/log \
	fjfnaranjo/tshock:4.3.26 \
	bash -c "cp -a /tshock/log/. /host/backups/$BACKUP_NAME/log/"
docker run --rm \
	-v "`pwd`:/host" \
	-v ${tshock_vol_prefix}world:/tshock/world \
	fjfnaranjo/tshock:4.3.26 \
	bash -c "cp -a /tshock/world/. /host/backups/$BACKUP_NAME/world/"

# Ensure regular user permissions for backup
docker run --rm \
	-v "`pwd`:/host" \
	fjfnaranjo/tshock:4.3.26 \
	chown -R `id -u`:`id -g` "/host/backups/$BACKUP_NAME"
