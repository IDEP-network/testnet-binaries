#!/bin/sh
rm -f /root/.ion/
/usr/local/bin/iond start
/usr/local/bin/iond init ${moniker} --chain-id ${chain}
mkdir -p /root/.ion/config/
cp /root/genesis.json /root/.ion/config/genesis.json
/usr/local/bin/iond start --p2p.persistent_peers="${api}" --rpc.laddr="tcp://0.0.0.0:26657"
exec "$@"

