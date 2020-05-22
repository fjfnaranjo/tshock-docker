#!/bin/sh

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

# Run tShock server
docker run --rm -ti \
	-p "7777:7777" \
	-p "7878:7878" \
	-v ${tshock_vol_prefix}config:/tshock/config \
	-v ${tshock_vol_prefix}world:/tshock/world \
	-v ${tshock_vol_prefix}log:/tshock/log \
	fjfnaranjo/tshock:4.4.0-pre6 \
	mono TerrariaServer.exe -configpath /tshock/config -worldpath /tshock/world -logpath /tshock/log $@
