# testnet-binaries
Binaries for Testnet Nodes

change .env file or use -e option

Test run:
docker run --name node -itd idepnetwork/testnet-denali
with env values:
docker run --name node -e moniker='moniker' -e chain='Test-Denali' -e accountname='accountname' -e api='3285f676050842aea5ce0c5968ef4b1579ffc8d9@104.131.46.133:26656,19f7aa0f2da7e6a01372be459a9c43bec6ac2191@64.225.75.108:26656' -itd idepnetwork/testnet-denali

