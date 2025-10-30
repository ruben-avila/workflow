#!/usr/bin/env bash

# Base directory of your dotfiles repo
DOTFILES_DIR="$HOME/.dotfiles"

# Declare an array of "source -> target" symlinks
LINKS=(
    "$DOTFILES_DIR/zshrc -> $HOME/.zshrc"
    "$DOTFILES_DIR/bashrc -> $HOME/.bashrc"
    "$DOTFILES_DIR/p10k.zsh -> $HOME/.p10k.zsh"

    "$DOTFILES_DIR/config/alacritty/alacritty.toml -> $HOME/.config/alacritty/alacritty.toml"
    "$DOTFILES_DIR/config/alacritty/dracula.toml -> $HOME/.config/alacritty/dracula.toml"

    "$DOTFILES_DIR/config/i3/config -> $HOME/.config/i3/config"
    "$DOTFILES_DIR/config/picom/picom.conf -> $HOME/.config/picom/picom.conf"
    "$DOTFILES_DIR/config/rofi/config.rasi -> $HOME/.config/rofi/config.rasi"
    "$DOTFILES_DIR/config/tmux/tmux.conf -> $HOME/.config/tmux/tmux.conf"

    "$DOTFILES_DIR/local/wallpapers/fondo.jpg -> $HOME/.local/wallpapers/fondo.jpg"

)

# Backup suffix
BACKUP_SUFFIX=".backup_$(date +%Y%m%d%H%M%S)"

for entry in "${LINKS[@]}"; do
    src="${entry%% -> *}"
    target="${entry##* -> }"

    # Ensure parent directory exists
    mkdir -p "$(dirname "$target")"

    # Backup existing files or symlinks
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Backing up $target -> $target$BACKUP_SUFFIX"
        mv "$target" "$target$BACKUP_SUFFIX"
    fi

    # Create the symlink
    echo "Linking $src -> $target"
    ln -s "$src" "$target"
done

echo "All dotfiles symlinks have been created!"
