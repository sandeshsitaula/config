### PATH - DONT COPY MY PATH - COPY YOUR OWN
export PATH=$HOME/bin:/usr/local/bin:/snap/bin:/opt/bin:$PATH

PS1='%n@%m %~$ '
### ZSH HOME
export ZSH=$HOME/.zsh

### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=100

# How many commands history will save on file.
export SAVEHIST=100

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
alias song=/home/sandesh/Music/mpvrun.sh
alias gorun=/home/sandesh/script/gorun.sh

alias ls="exa"
alias ll="exa -alh"
alias tree="exa --tree"

alias cat="bat"

 #fzf configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --color=never --hidden' 

#custom path 
export PATH=$PATH:/home/sandesh/go/bin
export PATH=$PATH:/home/.zsh/plugins/fzf-zsh-plugin/bin 

 export PATH=$PATH:"/home/sandesh/Downloads/Lapce"
 PATH=$PATH:"/home/sandesh/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/sandesh/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/sandesh/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/sandesh/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/sandesh/perl5"; export PERL_MM_OPT;

