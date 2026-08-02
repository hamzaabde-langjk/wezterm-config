#!/bin/bash


set -e  # Exit on error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== WezTerm Configuration Setup ===${NC}"

# 1. Create .config/wezterm directory if it doesn't exist
WEZTERM_DIR="$HOME/.config/wezterm"
if [ -d "$WEZTERM_DIR" ]; then
    echo -e "${YELLOW}Directory $WEZTERM_DIR already exists${NC}"
else
    echo -e "Creating $WEZTERM_DIR..."
    mkdir -p "$WEZTERM_DIR"
    echo -e "${GREEN}✓ Directory created${NC}"
fi

# 2. Move wezterm.lua to .config/wezterm/
if [ -f "wezterm.lua" ]; then
    echo -e "Moving wezterm.lua to $WEZTERM_DIR/"
    mv wezterm.lua "$WEZTERM_DIR/"
    echo -e "${GREEN}✓ wezterm.lua moved successfully${NC}"
else
    echo -e "${RED}✗ Error: wezterm.lua not found in current directory${NC}"
    exit 1
fi

# 3. Move h.sh to home directory
if [ -f "h.sh" ]; then
    echo -e "Moving h.sh to ~/"
    mv h.sh ~/
    chmod +x ~/h.sh  # Make it executable
    echo -e "${GREEN}✓ h.sh moved and made executable${NC}"
else
    echo -e "${RED}✗ Error: h.sh not found in current directory${NC}"
    exit 1
fi

# 4. Add contents of zhrc.txt to .bashrc and .zshrc
if [ -f "zhc.txt" ]; then
    echo -e "Adding zhrc.txt contents to shell rc files..."
    
    # Function to add content to rc file if not already present
    add_to_rc() {
        local rc_file="$1"
        local marker="# Added by wezterm setup script"
        
        if [ -f "$rc_file" ]; then
            # Check if content already exists
            if grep -q "$marker" "$rc_file"; then
                echo -e "${YELLOW}Content already exists in $rc_file, skipping...${NC}"
            else
                echo -e "\n$marker" >> "$rc_file"
                cat zhrc.txt >> "$rc_file"
                echo -e "${GREEN}✓ Added content to $rc_file${NC}"
            fi
        else
            echo -e "${YELLOW}$rc_file not found, creating it...${NC}"
            echo -e "\n$marker" > "$rc_file"
            cat zhrc.txt >> "$rc_file"
            echo -e "${GREEN}✓ Created $rc_file with content${NC}"
        fi
    }
    
    # Add to .bashrc
    add_to_rc "$HOME/.bashrc"
    
    # Add to .zshrc (note: you wrote .zhrc in the prompt, but typical is .zshrc)
    add_to_rc "$HOME/.zshrc"
    
    # Also check if you meant .zshrc specifically
    if [ -f "$HOME/.zhrc" ]; then
        echo -e "${YELLOW}Found .zhrc file, adding content there too...${NC}"
        add_to_rc "$HOME/.zhrc"
    fi
    
else
    echo -e "${RED}✗ Error: zhrc.txt not found in current directory${NC}"
    exit 1
fi

echo -e "${GREEN}=== Setup Complete! ===${NC}"
echo -e "You may need to restart your terminal or run:"
echo -e "  source ~/.bashrc  (for bash users)"
echo -e "  source ~/.zshrc   (for zsh users)"
echo -e ""
echo -e "WezTerm configuration is in: $WEZTERM_DIR/wezterm.lua"
echo -e "h.sh is available at: ~/h.sh"
