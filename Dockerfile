FROM ubuntu:18.04
env api=''
env moniker=''
env chain=''

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
