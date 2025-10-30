#!/usr/bin/env bash

# Base directory of your dotfiles repo
DOTFILES_DIR="$HOME/.dotfiles"

# Declare an array of "source -> target" symlinks
LINKS=(
    "$DOTFILES_DIR/config/home/zshrc -> $HOME/.zshrc"
    "$DOTFILES_DIR/config/home/bashrc -> $HOME/.bashrc"
    "$DOTFILES_DIR/config/home/p10k.zsh -> $HOME/.p10k.zsh"
    "$DOTFILES_DIR/config/alacritty -> $HOME/.config/alacritty"
    "$DOTFILES_DIR/config/i3 -> $HOME/.config/i3"
    "$DOTFILES_DIR/config/picom -> $HOME/.config/picom"
    "$DOTFILES_DIR/config/rofi -> $HOME/.config/rofi"
    "$DOTFILES_DIR/config/tmux -> $HOME/.config/tmux"
    "$DOTFILES_DIR/local/wallpapers -> $HOME/.local/wallpapers"
    "$DOTFILES_DIR/local/bin -> $HOME/.local/bin"
    "$DOTFILES_DIR/local/share/fonts -> $HOME/.local/share/fonts"
    "$DOTFILES_DIR/local/share/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme -> $HOME/.local/share/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme"
    "$DOTFILES_DIR/local/share/zsh-plugins/powerlevel10k/internal -> $HOME/.local/share/zsh-plugins/powerlevel10k/internal"
    "$DOTFILES_DIR/local/share/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh -> $HOME/.local/share/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
    "$DOTFILES_DIR/local/share/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh -> $HOME/.local/share/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
    "$DOTFILES_DIR/local/share/zsh-plugins/zsh-autosuggestions/src -> $HOME/.local/share/zsh-plugins/zsh-autosuggestions/src"
    "$DOTFILES_DIR/local/share/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh -> $HOME/.local/share/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
    "$DOTFILES_DIR/local/share/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh -> $HOME/.local/share/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    "$DOTFILES_DIR/local/share/zsh-plugins/zsh-syntax-highlighting/highlighters -> $HOME/.local/share/zsh-plugins/zsh-syntax-highlighting/highlighters"
)
# Backup suffix
BACKUP_SUFFIX=".backup_$(date +%Y%m%d%H%M%S)"

for entry in "${LINKS[@]}"; do
    src="${entry%% -> *}"
    target="${entry##* -> }"

    # Ensure parent directory exists
    mkdir -p "$(dirname "$target")"

    # Backup existing files or symlinks
    #if [ -e "$target" ] || [ -L "$target" ]; then
    #    echo "Backing up $target -> $target$BACKUP_SUFFIX"
    #    mv "$target" "$target$BACKUP_SUFFIX"
    #fi

    # Create symlink
    if [ -d "$src" ]; then
        ln -sfn "$src" "$target"  # use -n for directories
    else
        ln -sf "$src" "$target"
    fi

    echo "Linked $src -> $target"
done

echo "All dotfiles symlinks have been created!"
