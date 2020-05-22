FROM mono:6.8

WORKDIR /tshock

RUN \
	apt-get update && \
	apt-get install -y unzip wget && \
	rm -rf /var/lib/apt/lists/* /tmp/* && \
	wget https://github.com/Pryaxis/TShock/releases/download/v4.4.0-pre6/TShock_4.4.0_Pre6_Terraria1.4.0.3.zip && \
	unzip TShock_4.4.0_Pre6_Terraria1.4.0.3.zip && \
	rm TShock_4.4.0_Pre6_Terraria1.4.0.3.zip

