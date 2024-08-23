export PATH=$HOME/bin:/usr/local/bin:/snap/bin:/opt/bin:/home/sandesh/.local/bin:$PATH
#for showing current working directory
PS1='%n@%m %~$ '
### ZSH HOME
export ZSH=$HOME/.zsh

### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=500

# How many commands history will save on file.
export SAVEHIST=1000

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

#alias cat="bat -p"
 #fzf configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --color=never --hidden' 
##########################
#for case insensitivity matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

#custom path 
export PATH=$PATH:/home/sandesh/go/bin
export PATH=$PATH:/home/.zsh/plugins/fzf-zsh-plugin/bin 

setxkbmap -option caps:escape
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=7'
alias wifi_correct=/home/sandesh/script/wifi_correct.sh
