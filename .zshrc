export PATH=$HOME/bin:/usr/local/bin:/snap/bin:/opt/bin:/home/sandesh/.local/bin:/root/.local/bin:$PATH

# For Showing Current Working Directory
PS1='%n@%m %~$ '
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'

export ZSH=$HOME/.zsh

export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=1000

# How many commands history will save on file.
export SAVEHIST=5000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# ---- PLUGINS & THEMES -----------------------------------
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($ZSH/plugins/zsh-completions/src $fpath)
source $ZSH/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh


# Custom Aliases
alias ls="exa"
alias ll="exa -alh"
alias tree="exa --tree"
alias audiofixer="~/scripts/audiofixer.sh"
alias cd="z"
alias sp="systemctl suspend"
alias cat="batcat"
alias lgit="lazygit"
alias ldocker="lazydocker"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --color=never --hidden' 

# For Case Insensitivity Matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _match
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=**' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:/home/.zsh/plugins/fzf-zsh-plugin/bin 
export PATH=$PATH:/home/sandesh/Downloads/node-v20.17.0-linux-x64/bin
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
[ -s "/home/sandesh/.bun/_bun" ] && source "/home/sandesh/.bun/_bun"
export PATH="$HOME/.bun/bin:$PATH"
export PNPM_HOME="/home/sandesh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export PATH="${PATH}:/home/sandesh/.cargo/bin"

eval "$(zoxide init zsh)"

# --- Zsh Word Movement Bindings ---
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

