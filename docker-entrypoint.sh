#!/bin/sh
/usr/local/bin/iond start ${api}

exec "$@"

