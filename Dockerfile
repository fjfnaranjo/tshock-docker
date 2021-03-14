FROM mono:6.8

WORKDIR /tshock

COPY scripts/create-backup.sh scripts/restore-backup.sh /tshock/

RUN \
	apt-get update && \
	apt-get install -y unzip wget && \
	rm -rf /var/lib/apt/lists/* /tmp/*

RUN \
	mkdir -p /tshock/config && \
	mkdir -p /tshock/world && \
	mkdir -p /tshock/log

RUN \
	wget https://github.com/Pryaxis/TShock/releases/download/v4.4.0-pre15/TShock4.4.0_Pre15_Terraria1.4.1.2.zip && \
	unzip TShock4.4.0_Pre15_Terraria1.4.1.2.zip && \
	mv TShock4.4.0_Pre15_Terraria1.4.1.2/* . && \
	rm TShock4.4.0_Pre15_Terraria1.4.1.2.zip

ENTRYPOINT ["mono", "TerrariaServer.exe", "-configpath", "/tshock/config", "-worldselectpath", "/tshock/world", "-logpath", "/tshock/log"]
