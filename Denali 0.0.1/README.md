# Denali Test Network
## Full-Node Setup
- Download the IDEP client binary
- Add permissions to the binary
```
sudo chmod +x iond
```
- Move/Copy the binary to /usr/local/bin/
- Check the binary commands with
```
iond -h
```
### Node Initialization
```
iond init <moniker> --chain-id Test-Denali
iond keys add <accountname>
```
- Save the mnemonic
- Next make your way to the nodes config directory
```
cd ~/.iond/config/
```
- Remove the genesis.json and replace it with the one provided in this repo
### Start the node
```
iond start --p2p.persistent_peers=”3285f676050842aea5ce0c5968ef4b1579ffc8d9@104.131.46.133:26656,19f7aa0f2da7e6a01372be459a9c43bec6ac2191@64.225.75.108:26656“
```


### Validator-Setup
- Once the Full Node is up and running. Please share your IDEP address with the IDEP team. We will fund your address.
``` 
You can @ or DM denny007#3282 on Discord.
```
- To get your Public Address
```
iond keys list
```
- To get the Validator-pub-key
```
iond tendermint show-validator
```
- Command to create a Validator
```
iond tx staking create-validator --amount <amount> --from <from-address> --pubkey <validator-pub-key> --commission-rate 0.01 --commission-max-rate 0.05 --commission-max-change-rate 0.005 --min-self-delegation 1 --chain-id Test-Denali
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
