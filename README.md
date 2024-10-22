## H this git contains every important config in .config.

### Other files that are important but not in this repo:

- .bashrc:

#

# ~/.bashrc

#

# If not running interactively, don't do anything

[[$- != *i*]] && return

alias ls='ls --color=auto'

PS1="\[\e[1m\]\u\[\e[1;36m\]\[\033[m\]@\[\e[1;36m\]\h\[\033[m\]:\[\e[0m\]\[\e[1;32m\]\W >> \[\e[0m\]"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[! -f "$SSH_AUTH_SOCK"]]; then
source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias n="nvim"
alias nt="NVIM_APPNAME=nvim_latex nvim"

nv() {

# Assumes all configs exist in directories named ~/.config/nvim-\*

local config=$(find ~/.config -maxdepth 1 -name 'nvim\*'| fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)

# If I exit fzf without selecting a config, don't open Neovim

[[-z $config]] && echo "No config selected" && return

# Open Neovim with the selected config

NVIM_APPNAME=$(basename $config) nvim $@
}

export HISTSIZE=10000
export HISTFILESIZE=20000
shopt -s histappend
export PROMPT_COMMAND='history -a'

neofetch

eval "$(zoxide init bash)"
