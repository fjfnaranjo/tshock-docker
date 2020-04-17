FROM mono:6.8

RUN apt-get update \
    && apt-get install -y \
        unzip \
    && rm -rf /var/lib/apt/lists/* /tmp/*1

WORKDIR /tshock
ADD https://github.com/Pryaxis/TShock/releases/download/v4.3.26/tshock_4.3.26.zip /tmp
RUN unzip /tmp/tshock_4.3.26.zip
RUN rm /tmp/tshock_4.3.26.zip

ENTRYPOINT ["mono", "TerrariaServer.exe"]

