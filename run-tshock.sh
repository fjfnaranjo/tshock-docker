#!/bin/sh

docker-compose up --no-start
docker-compose run --rm --entrypoint "mono TerrariaServer.exe -configpath /var/tshock/config -worldpath /var/tshock/world -logpath /var/tshock/log" tshock

