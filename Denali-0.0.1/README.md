<h1><p align="center"><img alt="Banner" src="Denali.png" /></p></h1>

# Denali Test Network
## Full-Node Setup
- Download the IDEP client binary iond
```
git clone https://github.com/IDEP-network/testnet-binaries.git
```

- Add permissions to the binary
```
sudo chmod +x /testnet-binaries/Denali-0.0.1/iond
```
- Move/Copy the binary to /usr/local/bin/
```
cp testnet-binaries/Denali-0.0.1/iond /usr/local/bin/
```

- Check the binary commands with
```
iond -h
```
## Full-Node Initialization
```
iond init <moniker> --chain-id Test-Denali
iond keys add <accountname>
```
- Save the mnemonic
- Find then add your IP address in the external_address field in the config.toml file
```
external_address=$(curl -s ifconfig.me):26656
sed -i.bak -e "s/^external_address = \"\"/external_address = \"$external_address\"/" $HOME/.ion/config/config.toml
```
- Next make your way to the nodes config directory, remove the genesis.json and replace it with the one provided in this repo
```
cd ~/.ion/config/

rm genesis.json
wget https://raw.githubusercontent.com/IDEP-network/testnet-binaries/main/Denali-0.0.1/genesis.json
```

### Setup Service and start the node
```
export USERNAME=$(whoami)
sudo -E bash -c 'cat << EOF > /etc/systemd/system/iond.service
[Unit]
Description=Iond Daemon
After=network-online.target

[Service]
User=$USERNAME
ExecStart=/home/$USERNAME/go/bin/iond start --p2p.persistent_peers=95a7b71ab6ad8fad5f1ed3b49472683adea92cf1@142.93.65.220:26656,dc07da4be6ff285a1be2e9501fa92efef248d025@64.225.75.108:26656, 3774f7f8f841e4b21500fe51dff453f7a6851afb@143.198.137.45:26656
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF'
```

```
sudo systemctl enable iond.service
sudo systemctl start iond.service
```


### Validator-Setup
- Once the Full Node is up and running you can fund your wallet through the faucet https://faucet.idep.network/

- To get your Public Address
```
iond keys list
```
- Create a Validator

Before you can create your Validator, your node has to be synced up to the latest block of the chain. You can check this by:

```
iond status
```
If `catching_up` is `false` you are good to execute:

```
iond tx staking create-validator \
    --amount 10000000000idep \
    --commission-max-change-rate 0.01 \
    --commission-max-rate 0.2 \
    --commission-rate 0.1 \
    --from <YourWalletAddress> \
    --min-self-delegation 1 \
    --moniker <YourMoniker> \
    --pubkey $(iond tendermint show-validator) \
    --chain-id Test-Denali
```



### FAQ
#### Example of a command to create a Validator
```
iond tx staking create-validator --amount 15000000000000idep --from idep1d2nqcwf9zz9fx7xlesyt0gc3utfxe2mk6nfwey --pubkey idepvalconspub1zcjduepqztw5yzm5wj0yc600aaemxlmda5488jv9hycxfnta3w7vz9jgpawqc9qnhs --commission-rate 0.01 --commission-max-rate 0.05 --commission-max-change-rate 0.005 --min-self-delegation 1 --chain-id Test-Denali
```

#### To know more about the commands and other parameters
```
iond tx staking create-validator --help
```
#### Tendermint API Documentation
https://v1.cosmos.network/rpc/v0.41.4

**Note:** IDEP Token has 8 decimal places. If you wish to run a validator with 100,000 tokens you must set the ammount to --ammount 10000000000000
