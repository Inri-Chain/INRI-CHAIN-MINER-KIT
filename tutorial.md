# Quick Tutorial — INRI Chain (Linux)

## 0. Pre-requisites
- Linux x86_64 (AMD64)
- sudo / root privileges
- Internet connection

## 1. Clone the repository
```bash
git clone https://github.com/YOUR-ORG/INRI-CHAIN-MINER-KIT.git
cd INRI-CHAIN-MINER-KIT
```

## 2. Install geth (automatic)
```bash
sudo ./scripts/install-geth.sh
```

## 3. Initialize genesis (optional - start.sh will init if needed)
```bash
geth --datadir ~/.inri init genesis.json
```

## 4. Install static nodes
```bash
mkdir -p ~/.inri/geth
cp static-nodes.json ~/.inri/geth/static-nodes.json
```

## 5. Start mining
```bash
./start.sh 0xYOUR_ADDRESS
```

## 6. Check status
```bash
geth attach http://127.0.0.1:8545 --exec 'admin.peers'
geth attach http://127.0.0.1:8545 --exec 'eth.blockNumber'
```

If you use Docker:
```bash
docker compose up -d
```
