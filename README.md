# Dockerized tShock server for friends and fun
## Usage
* Run tShock using `./run-tshock.sh`.
* To create a backup use the `./create-backup.sh` script (stop the server first).
* Configure tShock in the created folder under 'backups' or access your world files there.
* Restore any backup with `./restore-backup.sh [name of backup folder]` (again, stop the server first).
## Useful commands to handle advance stuff
### Set vanilla permissions to group players
* First, create the group players with the tShock command: /group add players .
* Run `docker run --rm -ti -v config:/tshock/config fjfnaranjo/tshock:4.3.26 /bin/bash`.
* Then:
```
apt-get update
apt-get install sqlite3
sqlite3 /tshock/config/tshock.sqlite
UPDATE GroupList SET Commands='tshock.ignore.*,tshock.tp.rod,tshock.world.editspawn,tshock.npc.summonboss,tshock.world.movenpc,tshock.npc.hurttown,tshock.account.changepassword,tshock.world.modify' WHERE GroupName='players';
.quit
exit
```
