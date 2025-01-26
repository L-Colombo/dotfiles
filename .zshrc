##################################################
#
#  _     ____           _____    _
# | |   / ___|         |__  /___| |__  _ __ ___
# | |  | |      _____    / // __| '_ \| '__/ __|
# | |__| |___  |_____|  / /_\__ \ | | | | | (__
# |_____\____|         /____|___/_| |_|_|  \___|
#
#
############### Aliases ##########################
alias nv="nvim"
alias exa="exa --long --header --color=always --icons --git-ignore --sort=type"
alias tree="eza --color=always --icons --git-ignore --sort=type -T"
alias rust_repl="evcxr"
alias cp="cp -v"
alias mv="mv -v"
alias rm="rm -v"

############### Evals ############################
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(~/.rbenv/bin/rbenv init - --no-rehash zsh)"

############### Variables ########################
export EDITOR="nvim"
export PATH="$PATH:$HOME/.config/composer/vendor/bin/"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/scripts"
export WORDCHARS=${WORDCHARS/\/}
export WORDCHARS=${WORDCHARS/_}

############### Zinit plugin manager #############
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

############### Plugins installation #############
zinit load zsh-users/zsh-syntax-highlighting
zinit load zsh-users/zsh-completions
zinit load zsh-users/zsh-autosuggestions
zinit load Aloxaf/fzf-tab

zinit snippet OMZP::colored-man-pages

############### Other settings ###################

# Init completions
autoload -U compinit && compinit

# Completion settings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Keybindings for autosuggestions Emacs style
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Command line edit (open command in a text editor)
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# History of searches and commands
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Other options
setopt interactivecomments

# Unalias `zi` to avoid conflict between Zoxide and Zinit
unalias zi

# Custom functions

# Opens zatura and dishowns the process
function zz () {
    zathura $1  & ; disown && exit
}

# Change directory when closing yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Tmux StartUp. Opens new tmux session in poject with a default window layout
function tsu() {
    CURRENT_SESSION=$(basename "$PWD")

    tmux has-session -t $CURRENT_SESSION 2>/dev/null

    if (( $? == 0 )); then
        tmux attach-session -t $CURRENT_SESSION
    else
        tmux new-session -d -s $CURRENT_SESSION nvim;
        tmux new-window -d -n run;
        tmux new-window -d lazygit;

        tmux attach-session -t $CURRENT_SESSION;
    fi
}


[ -f "/home/lc/.ghcup/env" ] && . "/home/lc/.ghcup/env" # ghcup-env
