docker rm node -f
docker rmi idepnetwork/testnet-denali
docker build . -t idepnetwork/testnet-denali
docker push idepnetwork/testnet-denali
docker run --name node -itd idepnetwork/testnet-denali
