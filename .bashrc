##################################################
#  
#  _     ____           ____            _              
# | |   / ___|         | __ )  __ _ ___| |__  _ __ ___ 
# | |  | |      _____  |  _ \ / _` / __| '_ \| '__/ __|
# | |__| |___  |_____| | |_) | (_| \__ \ | | | | | (__ 
# |_____\____|         |____/ \__,_|___/_| |_|_|  \___|
#
#
##################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

############### Aliases ##########################
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias q='exit'
alias nv="nvim"
alias t="tmux"
alias p="pandoc"
alias r="ranger"
alias exa="exa --all --long --header --color=always --icons --git-ignore --sort=type"
alias tree="eza --long --header --color=always --icons --git-ignore --sort=type -T"

############### Evals ############################
eval "$(fzf --bash)"
eval "$(zoxide init bash)"

############### Variables ########################
export EDITOR="nvim"
export PATH="$HOME/.rbenv:$PATH"
export PATH="$PATH:$HOME/.config/composer/vendor/bin/"

############### Prompt Style #####################
PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

. "$HOME/.cargo/env"

############### Other settings ###################

# Smoother tab navigation and autocompletion
bind 'TAB:menu-complete'
bind '"\e[Z": menu-complete-backward' # Shift-TAB to cycle backward
bind 'set menu-complete-display-prefix on'
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'

# History of searches and commands
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
