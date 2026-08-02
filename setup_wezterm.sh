#!/bin/bash

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${GREEN}=== WezTerm Setup with xdotool ===${NC}"

# Install xdotool
echo -e "${YELLOW}Installing xdotool...${NC}"
if command -v xdotool &> /dev/null; then
    echo -e "${GREEN}✓ xdotool already installed${NC}"
else
    # Try common package managers
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y xdotool
    elif command -v dnf &> /dev/null; then
        sudo dnf install -y xdotool
    elif command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm xdotool
    elif command -v brew &> /dev/null; then
        brew install xdotool
    else
        echo -e "${RED}Could not install xdotool automatically. Please install manually.${NC}"
        exit 1
    fi
    echo -e "${GREEN}✓ xdotool installed${NC}"
fi

# Setup WezTerm config
mkdir -p ~/.config/wezterm
mv wezterm.lua ~/.config/wezterm/
mv h.sh ~/
chmod +x ~/h.sh

# Add to rc files
cat zhrc.txt >> ~/.bashrc
cat zhrc.txt >> ~/.zshrc
[ -f ~/.zhrc ] && cat zhrc.txt >> ~/.zhrc

echo -e "${GREEN}✓ Setup complete!${NC}"
echo -e "xdotool version: $(xdotool --version)"
