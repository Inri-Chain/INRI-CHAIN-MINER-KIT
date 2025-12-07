# INRI Chain — Miner Kit

Welcome to the official **INRI Chain Miner Kit** repository. This repo contains everything a new user needs to run a node, mine, and help the network.

**Goal:** make onboarding easy for new miners with scripts, genesis, configuration and clear instructions.

## What is included
- `genesis.json` — official INRI Chain genesis file
- `static-nodes.json` — official bootnodes
- `start.sh` — quick start script for Linux
- `start-windows.ps1` — quick start script for Windows
- `docker-compose.yml` — example node in Docker
- `scripts/install-geth.sh` — automatic installer for geth (Linux AMD64)
- `tutorial.md` — step-by-step guide
- `CONTRIBUTING.md`, `ISSUE_TEMPLATE.md`

## Quick Start (Linux)
1. Clone the repo:
```bash
git clone https://github.com/YOUR-ORG/INRI-CHAIN-MINER-KIT.git
cd INRI-CHAIN-MINER-KIT
```

2. Install geth (automatic):
```bash
sudo ./scripts/install-geth.sh
```

3. Initialize and start miner:
```bash
./start.sh 0xYOUR_ADDRESS
```

## Quick Start (Docker)
```bash
docker compose up -d
```

## Contributing
Please read `CONTRIBUTING.md`. Open issues or PRs for fixes and improvements.

## Contact
Telegram: https://t.me/YOUR_GROUP
Explorer: https://explorer.inri.life
RPC: https://rpc.inri.life
