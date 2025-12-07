#!/bin/bash
# Usage: ./start.sh 0xYOUR_ADDRESS
ETHERBASE=$1
if [ -z "$ETHERBASE" ]; then
  echo "Usage: ./start.sh 0xYOUR_ADDRESS"
  exit 1
fi

# Default datadir
DATADIR="$HOME/.inri"
mkdir -p "$DATADIR"

# Initialize genesis if not exists
if [ ! -d "$DATADIR/geth" ]; then
  echo "Initializing genesis..."
  geth --datadir "$DATADIR" init genesis.json
fi

# Start geth
geth --datadir "$DATADIR" \
  --networkid 3777 \
  --http --http.addr 0.0.0.0 --http.port 8545 --http.api eth,net,web3,miner \
  --ws --ws.addr 0.0.0.0 --ws.port 8546 --ws.api eth,net,web3 \
  --port 30303 \
  --syncmode full \
  --mine --miner.threads 1 --miner.etherbase $ETHERBASE
