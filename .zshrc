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
alias q="exit"
alias nv="nvim"
alias t="tmux"
alias p="pandoc"
alias r="ranger"
alias exa="exa --all --long --header --color=always --icons --git-ignore --sort=type"
alias tree="eza --color=always --icons --git-ignore --sort=type -T"

############### Evals ############################
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(~/.rbenv/bin/rbenv init - --no-rehash zsh)"

############### Variables ########################
export EDITOR="nvim"
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin/"

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

# Unalias `zi` to avoid conflict between Zoxide and Zinit
unalias zi

# Custom functions

#opens zatura and dishowns the process
zz () {
    zathura $1  & ; disown && exit
}
