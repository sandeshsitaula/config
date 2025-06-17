export PATH=$HOME/bin:/usr/local/bin:/snap/bin:/opt/bin:/home/sandesh/.local/bin:$PATH
#for showing current working directory
PS1='%n@%m %~$ '
### ZSH HOME
export ZSH=$HOME/.zsh

### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=1000

# How many commands history will save on file.
export SAVEHIST=5000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS
### ---- PLUGINS & THEMES -----------------------------------
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath=($ZSH/plugins/zsh-completions/src $fpath)
source $ZSH/plugins/fzf-zsh-plugin/fzf-zsh-plugin.plugin.zsh


#custom configuration
#
#custom aliases
alias gorun=/home/sandesh/script/gorun.sh

alias ls="exa"
alias ll="exa -alh"
alias tree="exa --tree"
alias sgit="~/scripts/gitswitch.sh"
alias audiofixer="~/scripts/audiofixer.sh"
alias cd="z"

#alias cat="bat -p"
 #fzf configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --color=never --hidden' 
##########################
#for case insensitivity matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _match
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=**' 'l:|=* r:|=*'

autoload -Uz compinit && compinit

#custom path 
export PATH=$PATH:/home/sandesh/go/bin
export PATH=$PATH:/home/.zsh/plugins/fzf-zsh-plugin/bin 
export PATH=$PATH:/home/sandesh/Downloads/node-v20.17.0-linux-x64/bin
export PATH=$PATH:/root/.local/bin
export ANDROID_HOME=~/Android/Sdk
export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH
export PATH=$ANDROID_HOME/emulator:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

export PATH=$PATH:/usr/NX/bin

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'

eval "$(zoxide init zsh)"

# bun completions
[ -s "/home/sandesh/.bun/_bun" ] && source "/home/sandesh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/sandesh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
