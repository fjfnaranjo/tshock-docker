# Dockerized TShock server for friends and fun
This is a Docker image and Docker Compose file to run a dockerized [TShock](https://github.com/Pryaxis/TShock) server to play Terraria.
## Usage
### Pull the image
`docker pull fjfnaranjo/tshock:4.4.0-pre10`
### Build the image
`docker build -t fjfnaranjo/tshock:4.4.0-pre10 .`
### Running TShock
``docker run --rm -ti -v `pwd`:/host -v config:/tshock/config -v world:/tshock/world -v log:/tshock/log -p "7777:7777" -p "7878:7878" fjfnaranjo/tshock:4.4.0-pre10``

**Note:** You shouldn't detach from the service as TShock is not prepared to run properly without an interactive terminal.
### Stopping TShock
Don't stop TShock killing the process. Use the */off* server command in the TShock command prompt.
### Creating and restoring backups
``docker run --rm -ti -u $UID -v `pwd`:/host -v config:/tshock/config -v world:/tshock/world -v log:/tshock/log -p "7777:7777" -p "7878:7878" --entrypoint /tshock/create-backup.sh fjfnaranjo/tshock:4.4.0-pre10 [backup dirname]``

``docker run --rm -ti -v `pwd`:/host -v config:/tshock/config -v world:/tshock/world -v log:/tshock/log -p "7777:7777" -p "7878:7878" --entrypoint /tshock/restore-backup.sh fjfnaranjo/tshock:4.4.0-pre10 [backup dirname]``
#### Notes about backups
- **You must remember** to stop TShock first before any backup operations.
- The backup directory must reside under the current directory (it is accessed using a Docker volume pointing to '.').
- You can configure TShock in the created directory or access your world files there. Then you can restore the modified backup to commit that changes to the server.