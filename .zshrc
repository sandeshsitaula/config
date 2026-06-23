# ---- DOCKER FIX (MUST BE AT THE TOP) ----
export ZSH=$HOME/.zsh
export ZSH_CACHE_DIR="$ZSH/cache"
mkdir -p "$ZSH_CACHE_DIR/completions" 2>/dev/null

export PATH=$HOME/bin:/usr/local/bin:/snap/bin:/opt/bin:/home/sandesh/.local/bin:/root/.local/bin:$PATH

# ---- UI / PROMPT (FIXED) ----
setopt PROMPT_SUBST  # This allows the variables to actually work
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats ' %F{3}(%b)%f%u%c'
zstyle ':vcs_info:git:*' unstagedstr ' %F{1}✗%f'
PROMPT='%F{2}➜%f  %F{2}%~%f${vcs_info_msg_0_} %F{2}❯%f '

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'

export HISTFILE=$ZSH/.zsh_history
export HISTSIZE=1000
export SAVEHIST=5000
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY

# Append to the history file immediately, don't wait for shell exit
setopt INC_APPEND_HISTORY

mkdir -p $ZSH/completions 2>/dev/null
fpath=($ZSH/completions $ZSH/plugins/zsh-completions/src $fpath)

# ---- COMPLETION SYSTEM ----
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _match
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=**' 'l:|=* r:|=*'

# ---- PLUGINS & THEMES ----
fpath=($ZSH/plugins/zsh-completions/src $fpath)

source $ZSH/plugins/git/git.plugin.zsh
source $ZSH/plugins/extract/extract.plugin.zsh
source $ZSH/plugins/docker/docker.plugin.zsh
source $ZSH/plugins/docker-compose/docker-compose.plugin.zsh
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh

# ---- ALIASES & TOOLS ----
alias ls="exa"
alias ll="exa -alh"
alias tree="exa --tree"
alias audiofixer="~/scripts/audiofixer.sh"
alias cd="z"
alias cat="batcat"
alias lgit="lazygit"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --color=never --hidden' 

# ---- FINAL PATHS & ENV ----
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$ZSH/plugins/fzf-zsh-plugin/bin 
export PATH=$PATH:/home/sandesh/Downloads/node-v20.17.0-linux-x64/bin
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
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


# Alias to write notes using your script
alias note='$HOME/scripts/note.sh'

# Alias to read the master file (prints out the last 40 lines)
alias note-read='tail -n 40 "$HOME/.journal/journal.txt"'
