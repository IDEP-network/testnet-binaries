<h1><p align="center"><img alt="Banner" src="Denali.png" /></p></h1>

# Denali Test Network
## Full-Node Setup
- Download the IDEP client binary iond
- Add permissions to the binary
```
sudo chmod +x iond
```
- Move/Copy the binary to /usr/local/bin/
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
- Next make your way to the nodes config directory
```
cd ~/.ion/config/
```
- Remove the genesis.json and replace it with the one provided in this repo
### Start the node
```
iond start --p2p.persistent_peers=95a7b71ab6ad8fad5f1ed3b49472683adea92cf1@142.93.65.220:26656,dc07da4be6ff285a1be2e9501fa92efef248d025@64.225.75.108:26656
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

**Note:** IDEP Token has 8 decimal places. If you wish to run a validator with 100,000 tokens you must set the ammount to --ammount 10000000000000
