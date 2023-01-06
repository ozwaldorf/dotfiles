#!/bin/bash

YAY_PKGS=(discord git-delta zsh starship helix bat exa nodejs yarn)
CARGO_PKGS=()

# cool ascii art
printf "
  ____            _
 |  _ \ __ _  ___| | ____ _  __ _  ___  ___
 | |_) / _  |/ __| |/ / _  |/ _  |/ _ \/ __|
 |  __/ (_| | (__|   < (_| | (_| |  __/\__ \\
 |_|   \__,_|\___|_|\_\__,_|\__, |\___||___/
                            |___/
"

# check if yay is installed
which yay &> /dev/null || { echo "yay is not installed"; exit 1; }

# Install packages
# shellcheck disable=SC2068
yay -S --needed --noconfirm ${YAY_PKGS[@]}

# Install rust & cargo packages
yay -S --needed --noconfirm rustup && rustup default stable
for pkg in "${CARGO_PKGS[@]}"; do
    cargo install "$pkg"
done

printf "\n\n  Package installation complete!"
