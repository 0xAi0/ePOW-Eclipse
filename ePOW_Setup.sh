#!/bin/bash

GREEN="\033[1;32m"
YELLOW="\033[1;33m"
NC="\033[0m" # No Color

function pause() {
  read -rp "$(echo -e ${YELLOW}">>> Press Enter to continue...${NC}")"
}

echo -e "${GREEN}
======================================
   ePOW Eclipse \$BITZ Setup (Ubuntu)
======================================
${NC}"

pause

# 1. Install Rust
echo -e "${YELLOW}[1/8] Installing Rust...${NC}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# 2. Install Solana CLI
pause
echo -e "${YELLOW}[2/8] Installing Solana CLI...${NC}"
curl --proto '=https' --tlsv1.2 -sSfL https://solana-install.solana.workers.dev | bash

# 3. Create a Wallet (Keypair)
pause
echo -e "${YELLOW}[3/8] Creating Solana Wallet (Keypair)...${NC}"
solana-keygen new

# 4. Install Bitz CLI
pause
echo -e "${YELLOW}[4/8] Installing Bitz CLI...${NC}"
cargo install bitz

# 5. Set RPC
pause
echo -e "${YELLOW}[5/8] Setting RPC to Eclipse...${NC}"
solana config set --url https://mainnetbeta-rpc.eclipse.xyz/

# 6. Create screen session
pause
echo -e "${YELLOW}[6/8] Launching new 'eclipse' screen session...${NC}"
screen -S eclipse

# 7. Start mining
pause
echo -e "${YELLOW}[7/8] Ready to start mining! You need 0.005 \$ETH on Eclipse to proceed.${NC}"
echo -e "Once funded, run:"
echo -e "${GREEN}bitz collect${NC}"

# Optional commands
pause
echo -e "${YELLOW}[8/8] Extra Commands:${NC}"
echo -e "${GREEN}
• Claim rewards:        bitz claim
• Check balance:        bitz account
• Adjust CPU cores:     bitz collect --cores 8
• Help:                 bitz -h
${NC}"

# Backpack import
pause
echo -e "${YELLOW}To import to Backpack Wallet:${NC}"
echo -e "1. Run: ${GREEN}solana config get${NC} to get the keypair path."
echo -e "2. Then run: ${GREEN}cat <keypair-path>${NC}"
echo -e "3. Copy the array of numbers and paste it into Backpack under 'Private Key' import."

echo -e "${GREEN}✅ Setup Completed! Happy Mining!${NC}"
