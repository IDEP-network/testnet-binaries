change .env file or use -e option
Example:

docker run -p 26656:26656 -p 26657:26657 -p 1317:1317 -e api='--p2p.persistent_peers=3285f676050842aea5ce0c5968ef4b1579ffc8d9@104.131.46.133:26656,19f7aa0f2da7e6a01372be459a9c43bec6ac2191@64.225.75.108:26656' -itd idepnetwork/testnet-denali
