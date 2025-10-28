#!/usr/bin/env bash

# Base directory of your dotfiles repo
DOTFILES_DIR="$HOME/.dotfiles"

# Declare an array of "source -> target" symlinks
LINKS=(
    "$DOTFILES_DIR/.zshrc -> $HOME/.zshrc"
    "$DOTFILES_DIR/bashrc -> $HOME/.bashrc"
    "$DOTFILES_DIR/p10k.zsh -> $HOME/.p10k.zsh"

    "$DOTFILES_DIR/config/alacritty/alacritty.toml -> $HOME/.config/alacritty/alacritty.toml"
    "$DOTFILES_DIR/config/alacritty/dracula.toml -> $HOME/.config/alacritty/dracula.toml"

    "$DOTFILES_DIR/config/i3/config -> $HOME/.config/i3/config"
    "$DOTFILES_DIR/config/picom/picom.conf -> $HOME/.config/picom/picom.conf"
    "$DOTFILES_DIR/config/rofi/config.rasi -> $HOME/.config/rofi/config.rasi"
    "$DOTFILES_DIR/config/tmux/tmux.conf -> $HOME/.config/tmux/tmux.conf"

    "$DOTFILES_DIR/local/bin/tmux_auto -> $HOME/.local/bin/tmux_auto"
    "$DOTFILES_DIR/local/wallpapers/fondo.jpg -> $HOME/.local/wallpapers/fondo.jpg"

    "$DOTFILES_DIR/local/powerlevel10k/powerlevel10k.zsh-theme -> $HOME/.local/powerlevel10k/powerlevel10k.zsh-theme"
    "$DOTFILES_DIR/local/powerlevel10k/internal/configure.zsh -> $HOME/.local/powerlevel10k/internal/configure.zsh"
    "$DOTFILES_DIR/local/powerlevel10k/internal/icons.zsh -> $HOME/.local/powerlevel10k/internal/icons.zsh"
    "$DOTFILES_DIR/local/powerlevel10k/internal/p10k.zsh -> $HOME/.local/powerlevel10k/internal/p10k.zsh"
    "$DOTFILES_DIR/local/powerlevel10k/internal/parser.zsh -> $HOME/.local/powerlevel10k/internal/parser.zsh"
    "$DOTFILES_DIR/local/powerlevel10k/internal/wizard.zsh -> $HOME/.local/powerlevel10k/internal/wizard.zsh"
    "$DOTFILES_DIR/local/powerlevel10k/internal/worker.zsh -> $HOME/.local/powerlevel10k/internal/worker.zsh"

    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh -> $HOME/.local/zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh -> $HOME/.local/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh"

    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/src/async.zsh -> $HOME/.local/zsh/zsh-autosuggestions/src/async.zsh"
    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/src/bind.zsh -> $HOME/.local/zsh/zsh-autosuggestions/src/bind.zsh"
    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/src/config.zsh -> $HOME/.local/zsh/zsh-autosuggestions/src/config.zsh"
    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/src/fetch.zsh -> $HOME/.local/zsh/zsh-autosuggestions/src/fetch.zsh"
    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/src/highlight.zsh -> $HOME/.local/zsh/zsh-autosuggestions/src/highlight.zsh"
    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/src/start.zsh -> $HOME/.local/zsh/zsh-autosuggestions/src/start.zsh"
    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/src/util.zsh -> $HOME/.local/zsh/zsh-autosuggestions/src/util.zsh"
    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/src/widgets.zsh -> $HOME/.local/zsh/zsh-autosuggestions/src/widgets.zsh"

    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/src/strategies/completion.zsh -> $HOME/.local/zsh/zsh-autosuggestions/src/strategies/completion.zsh"
    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/src/strategies/history.zsh -> $HOME/.local/zsh/zsh-autosuggestions/src/strategies/history.zsh"
    "$DOTFILES_DIR/local/zsh/zsh-autosuggestions/src/strategies/match_prev_cmd.zsh -> $HOME/.local/zsh/zsh-autosuggestions/src/strategies/match_prev_cmd.zsh"
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
