#!/bin/sh

# chdir to script directory
cd "$(dirname "$0")"

# Ensure tShock service image and volumes
docker-compose up --no-start

# Run tShock CLI
docker-compose run --rm --entrypoint "mono TerrariaServer.exe -configpath /var/tshock/config -worldpath /var/tshock/world -logpath /var/tshock/log" tshock

