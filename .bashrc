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
alias nv="nvim"
alias exa="exa --all --long --header --color=always --icons --git-ignore --sort=type"
alias tree="eza --long --header --color=always --icons --git-ignore --sort=type -T"
alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"
alias ls="ls --color=always"

############### Evals ############################
eval "$(fzf --bash)"
eval "$(zoxide init bash)"

############### Variables ########################
export EDITOR="nvim"
export PATH="$HOME/.local/share/gem/ruby/3.2.0/bin/:$PATH"
export PATH="$PATH:$HOME/.config/composer/vendor/bin/"
export PATH="$PATH:$HOME/scripts"
export WORDCHARS=${WORDCHARS/\/}
export WORDCHARS=${WORDCHARS/_}

############### Prompt Style #####################
PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

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

# Tmux StartUp. Opens new tmux session in poject with a default window layout
function tsu() {
    CURRENT_SESSION=$(basename "$PWD")

    tmux has-session -t "$CURRENT_SESSION" 2>/dev/null

    if (( $? == 0 )); then
        tmux attach-session -t "$CURRENT_SESSION"
    else
        tmux new-session -d -s "$CURRENT_SESSION" nvim;
        tmux new-window -d -n run;
        tmux new-window -d lazygit;

        tmux attach-session -t "$CURRENT_SESSION";
    fi
}

# Source language environments
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env"
