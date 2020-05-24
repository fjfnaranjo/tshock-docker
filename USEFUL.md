# Useful commands to handle the server
## Set vanilla permissions and SSC support
* First, in the server command prompt, create the groups 'players' and 'sccplayers' with the TShock commands: `/group add players` and `/group add sccplayers` .
* Stop the server with `/off`.
* Run `docker run --rm -ti -v config:/tshock/config --entrypoint /bin/bash fjfnaranjo/tshock:4.4.0-pre7`.
* Then:
```
apt-get update
apt-get -y install sqlite3
sqlite3 /tshock/config/tshock.sqlite
UPDATE GroupList SET Commands='tshock.ignore.*,tshock.tp.rod,tshock.world.editspawn,tshock.npc.summonboss,tshock.world.movenpc,tshock.npc.hurttown,tshock.account.changepassword,tshock.world.modify,tshock.world.paint,tshock.tp.wormhole,tshock.npc.spawnpets,tshock.npc.startinvasion,tshock.npc.startdd2,tshock.world.time.usesundial,tshock.world.toggleparty,tshock.canchat,tshock.ssc.upload' WHERE GroupName='players';
UPDATE GroupList SET Commands='tshock.ignore.sendtilesquare,tshock.ignore.removetile,tshock.ignore.projectile,tshock.ignore.placetile,tshock.ignore.paint,tshock.ignore.noclip,tshock.ignore.mp,tshock.ignore.liquid,tshock.ignore.itemstack,tshock.ignore.hp,tshock.ignore.damage,tshock.tp.rod,tshock.world.editspawn,tshock.npc.summonboss,tshock.world.movenpc,tshock.npc.hurttown,tshock.account.changepassword,tshock.world.modify,tshock.world.paint,tshock.tp.wormhole,tshock.npc.spawnpets,tshock.npc.startinvasion,tshock.npc.startdd2,tshock.world.time.usesundial,tshock.world.toggleparty,tshock.canchat' WHERE GroupName='sccplayers';
.quit
exit
```