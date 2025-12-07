# Usage: .\start-windows.ps1 0xYOUR_ADDRESS
param([string]$Etherbase)
if (-not $Etherbase) {
  Write-Host "Use: .\start-windows.ps1 0xYOUR_ADDRESS"
  exit
}

$datadir = "$env:USERPROFILE\inri"
if (-not (Test-Path $datadir)) { New-Item -ItemType Directory -Path $datadir }

# Initialize genesis
geth.exe init genesis.json --datadir $datadir

# Start node (adjust path to geth.exe if needed)
Start-Process -NoNewWindow -FilePath "geth.exe" -ArgumentList @(
  "--datadir", $datadir,
  "--networkid", "3777",
  "--http", "--http.addr", "0.0.0.0", "--http.port", "8545", "--http.api", "eth,net,web3,miner",
  "--ws", "--ws.addr", "0.0.0.0", "--ws.port", "8546", "--ws.api", "eth,net,web3",
  "--port", "30303",
  "--syncmode", "full",
  "--mine", "--miner.threads", "1", "--miner.etherbase", $Etherbase
) -Wait
