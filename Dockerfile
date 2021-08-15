FROM ubuntu:18.04
env api='3285f676050842aea5ce0c5968ef4b1579ffc8d9@104.131.46.133:26656,19f7aa0f2da7e6a01372be459a9c43bec6ac2191@64.225.75.108:26656'
env moniker='moniker'
env chain='Test-Denali'
env accountname='accountname'

RUN apt update && apt install nano git curl -y

COPY ./Denali-0.0.1/genesis.json /root/genesis.json
COPY ./Denali-0.0.1/iond /usr/local/bin/iond
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN ["chmod", "+x", "/usr/local/bin/iond"]
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

ENTRYPOINT ["sh","/docker-entrypoint.sh"]
EXPOSE 1317
EXPOSE 26656
EXPOSE 26657
