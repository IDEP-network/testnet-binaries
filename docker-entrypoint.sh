#!/bin/sh
/usr/local/bin/iond init ${moniker} ${chain-id}
/usr/local/bin/iond keys add ${accountname}
/usr/local/bin/iond start ${api}

exec "$@"

