#!/bin/sh
docker run --rm -ti \
	-p "7777:7777" \
	-p "7878:7878" \
	-v config:/tshock/config \
	-v world:/tshock/world \
	-v log:/tshock/log \
	fjfnaranjo/tshock:4.3.26 \
	mono TerrariaServer.exe -configpath /tshock/config -worldpath /tshock/world -logpath /tshock/log $@
