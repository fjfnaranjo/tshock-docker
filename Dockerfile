FROM mono:6.8

WORKDIR /tshock

COPY scripts/create-backup.sh scripts/restore-backup.sh /tshock/

RUN \
	apt-get update && \
	apt-get install -y unzip wget && \
	rm -rf /var/lib/apt/lists/* /tmp/* && \
	mkdir -p /tshock/config && \
	mkdir -p /tshock/world && \
	mkdir -p /tshock/log && \
	wget https://github.com/Pryaxis/TShock/releases/download/v4.4-pre10/TShock4.4.0_Pre10_Terraria1.4.0.4.zip && \
	unzip TShock4.4.0_Pre10_Terraria1.4.0.4.zip && \
	rm TShock4.4.0_Pre10_Terraria1.4.0.4.zip

ENTRYPOINT ["mono", "TerrariaServer.exe", "-configpath", "/tshock/config", "-worldselectpath", "/tshock/world", "-logpath", "/tshock/log"]
