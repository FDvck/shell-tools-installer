#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "========================================"
echo " Installing Shell Tools (zoxide + fzf) "
echo "========================================"

# 1. Update repositories and install packages
echo "[+] Updating repositories..."
sudo apt update -y

echo "[+] Installing zoxide and fzf..."
sudo apt install -y zoxide fzf

# 2. Function to inject configuration without duplicating
inject_config() {
    local target_file="$1"
    local config_line="$2"
    local description="$3"

    # If the file exists, check if it already contains the configuration
    if [ -f "$target_file" ]; then
        if grep -Fq "$config_line" "$target_file"; then
            echo " [~] $description is already configured in $target_file (Skipping)."
        else
	    echo "$config_line" >> "$target_file"
            echo " [+] $description added to $target_file."
        fi
    fi
}

# 3. Configuration for ZSH
ZSH_RC="$HOME/.zshrc"
echo "[+] Configuring ZSH..."
inject_config "$ZSH_RC" 'eval "$(zoxide init zsh)"' "Zoxide (Zsh)"
inject_config "$ZSH_RC" 'source /usr/share/doc/fzf/examples/key-bindings.zsh' "fzf keybinddings (Zsh)"

# 4. Configuration for BASH
BASH_RC="$HOME/.bashrc"
echo "[+] Configuring BASH..."
inject_config "$BASH_RC" 'eval "$(zoxide init bash)"' "Zoxide (Bash)"
inject_config "$BASH_RC" 'source /usr/share/doc/fzf/examples/key-bindings.bash' "fzf keybindings (Bash)"

echo "========================================"
echo " Installation completed successfully! "
echo " To apply the changes immediately, run:"
echo " source ~/.zshrc  (or source ~/.bashrc if using bash)"
echo "========================================"
