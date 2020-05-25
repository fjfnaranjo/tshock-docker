FROM mono:6.8

WORKDIR /tshock

COPY scripts/create-backup.sh scripts/restore-backup.sh /tshock/

RUN \
	apt-get update && \
	apt-get install -y unzip wget && \
	rm -rf /var/lib/apt/lists/* /tmp/* && \
	mkdir -p /tshock/config && \
	mkdir -p /tshock/world && \
	mkdir -p /root/.local/share/Terraria && \
	ln -s /tshock/world /root/.local/share/Terraria/Worlds && \
	mkdir -p /tshock/log && \
	wget https://github.com/Pryaxis/TShock/releases/download/v4.4.0-pre8/TShock_4.4.0_Pre8_Terraria1.4.0.4.zip && \
	unzip TShock_4.4.0_Pre8_Terraria1.4.0.4.zip && \
	rm TShock_4.4.0_Pre8_Terraria1.4.0.4.zip

ENTRYPOINT ["mono", "TerrariaServer.exe", "-configpath", "/tshock/config", "-logpath", "/tshock/log"]
