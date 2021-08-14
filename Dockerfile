FROM ubuntu:18.04


RUN apt update && apt install nano git curl -y
COPY ./Denali-0.0.1/iond /usr/local/bin/iond
RUN ["chmod", "+x", "/usr/local/bin/iond"]

COPY ./Denali-0.0.1/genesis.json /root/.ion/config/genesis.json
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN ["chmod", "+x", "/docker-entrypoint.sh"]

ENTRYPOINT [ "/docker-entrypoint.sh" ]
EXPOSE 1317
EXPOSE 26656
EXPOSE 26657
