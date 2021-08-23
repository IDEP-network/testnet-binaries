# testnet-binaries
Binaries for Testnet Nodes



# Quick Start: run a Testnet docker container #

Step 1: Start Freeflow router (one instance per server)
```
sudo docker run --name node -e moniker='Your_moniker' -e chain='Your_Chain' -e api='your_api_token' -itd idepnetwork/testnet-denali
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

