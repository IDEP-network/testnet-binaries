# testnet-binaries
Binaries for Testnet Nodes



# Quick Start: run a Testnet docker container #

Step 1: Start Freeflow router (one instance per server)
```
sudo docker run --name node -e moniker='Your_moniker' -e chain='Your_Chain' -e api='your_api_token' -p 26656:26656 -p 26657:26657 -p 1317:1317 -itd idepnetwork/testnet-denali

Eg: sudo docker run --name node -e moniker='Master' -e chain='Test-Denali' -e api='95a7b71ab6ad8fad5f1ed3b49472683adea92cf1@142.93.65.220:26656,dc07da4be6ff285a1be2e9501fa92efef248d025@64.225.75.108:26656' -p 26656-26657:26656-26657 -p 1317:1317 -itd idepnetwork/testnet-denali
```

Step 2: Log into the Node container with
```
sudo docker exec -it node bash
```
Step 3: Check Node status
```
iond status
```

# Docker Installation: #
if you don't have docker on your host, you can simply install it with
```
sudo curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh
```

# Contacts #

