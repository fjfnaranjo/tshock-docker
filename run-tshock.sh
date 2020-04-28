#!/bin/sh

# Format tShock prefix
if [ "$TSHOCK_VOL_PREFIX" != ""]; then
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
	fjfnaranjo/tshock:4.3.26 \
	mono TerrariaServer.exe -configpath /tshock/config -worldpath /tshock/world -logpath /tshock/log $@
