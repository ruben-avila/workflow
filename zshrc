
# PATH
# add home local bin
export PATH="$HOME/.local/bin:$PATH"

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors 'di=1;34:ln=1;36:so=1;32:pi=1;33:ex=31:bd=1;30;46:cd=97;100:su=30;41:sg=30;46:tw=30;42:ow=30;43'
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original true
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''


zstyle :compinstall filename '/home/ruben/.zshrc'


ZSH_COMPDUMP="$HOME/.cache/zcompdump"
mkdir -p "${ZSH_COMPDUMP:h}"

autoload -Uz compinit
compinit -d "$ZSH_COMPDUMP"
# End of lines added by compinstall

# Lines configured by zsh-newuser-install
HISTFILE=~/.local/zsh_history
HISTSIZE=3000
SAVEHIST=99999
setopt autocd extendedglob nomatch
unsetopt beep notify
bindkey -e
# End of lines configured by zsh-newuser-install





#lscolors regular
# di=34:ln=36:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43
#lscolors bold
# di=1;34:ln=1;36:so=1;32:pi=1;33:ex=31:bd=1;34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43


source ~/.local/share/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source ~/.local/share/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#737373,underline"

#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.sh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


alias ls='lsd --group-directories-first'
alias ll='lsd -alh --group-directories-first'
alias cat='bat'
alias ncat='/usr/bin/cat'

alias lock='i3lock -u -i ~/.local/wallpapers/i3lock.png'

#alias firefox='swallow -d firejail firefox --enable-features=WebContentsForceDark'
alias chrome='swallow -d firejail --noprofile /opt/chrome-linux/chrome --enable-features=WebContentsForceDark'
alias gimp='swallow gimp'
alias dolphin='swallow dolphin'
#alias code='swallow /opt/VSCode-linux-x64/code'
