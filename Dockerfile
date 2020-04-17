FROM mono:6.8

WORKDIR /tshock

RUN \
	apt-get update && \
	apt-get install -y unzip wget && \
	rm -rf /var/lib/apt/lists/* /tmp/* && \
	wget https://github.com/Pryaxis/TShock/releases/download/v4.3.26/tshock_4.3.26.zip && \
	unzip tshock_4.3.26.zip && \
	rm tshock_4.3.26.zip

