# Dockerized tShock server for friends and fun
## Userful commands
### Set vanilla permissions to group players
```
apt-get update
apt-get install sqlite3
sqlite3 /var/tshock/config/tshock.sqlite
UPDATE GroupList SET Commands='tshock.ignore.*,tshock.tp.rod,tshock.world.editspawn,tshock.npc.summonboss,tshock.world.movenpc,tshock.npc.hurttown,tshock.account.changepassword,tshock.world.modify' WHERE GroupName='players';
```
