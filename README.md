# Dockerized tShock server for friends and fun
## Requirements
* Docker.
* Docker Compose.
* A bash compatible shell.
## Usage
* Run `./run-server.sh`.
 * Create a world called "Docker" (service will crash later it you don't use this name).
* Exit the tShock CLI (press control+C and wait a moment).
* Manage the server with Docker Compose as normal: `docker-compose up -d` (or down).
### Access content in the service volumes
* Run `./create-backup.sh` (this command will stop the server if is running).
* Configure tShock in the created folder under 'backups' or access your world files there.
* Commit your configuration to the service with `./restore-backup.sh [name of backup folder]` (it will replace existing contents).
## Useful commands to handle advance stuff
### Set vanilla permissions to group players
* Create the "players" group with tShock commands.
* Run `docker-compose run --entrypoint "" --rm tshock /bin/bash`.
* Then:
```
apt-get update
apt-get install sqlite3
sqlite3 /var/tshock/config/tshock.sqlite
UPDATE GroupList SET Commands='tshock.ignore.*,tshock.tp.rod,tshock.world.editspawn,tshock.npc.summonboss,tshock.world.movenpc,tshock.npc.hurttown,tshock.account.changepassword,tshock.world.modify' WHERE GroupName='players';
```
