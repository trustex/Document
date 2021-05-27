#!/bin/bash

pnum=$1

if [ "$pnum" = "" ]; then
    echo "please input note number!"
    exit 1
fi

PORT1=$((pnum+1660))
PORT2=$((pnum+1760))
PORT3=$((pnum+1860))

bee start \
  --verbosity 5 \
  --swap-initial-deposit 10000000000000000 \
  --swap-endpoint https://rpc.slock.it/goerli \
  --debug-api-enable \
  --clef-signer-enable \
  --clef-signer-endpoint=/var/lib/bee-clef/clef.ipc \
  --api-addr ":${PORT1}" \
  --p2p-addr ":${PORT2}" \
  --debug-api-addr ":${PORT3}" \
  --data-dir "/data/swarm/bee${PORT1}-data" \
  --password "密码" > bee.log.${PORT1} 2>&1 &
