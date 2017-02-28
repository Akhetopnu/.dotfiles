# THE VIM MAGIC
# set -o vi

# COLORFUL MANPAGES :D
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# eval $(keychain --eval --quiet --confhost --timeout 60)
# eval $(ssh-agent) > /dev/null

PS1='in \w '

unset use_color safe_term match_lhs sh
xhost +local:root > /dev/null 2>&1
# complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize
shopt -s expand_aliases
# export QT_SELECT=4
shopt -s histappend # Enable history appending instead of overwriting.  #139609
shopt -s autocd # just type folder name to cd into it
shopt -s cmdhist
shopt -s dotglob
shopt -s lithist
shopt -s nocaseglob
stty -ixon # block that stupid CTRL+S screen freeze
complete -F _filedir_xspec fdisk

alias mv="mv -v"
alias cp="cp -v"
alias mkdir="mkdir -vp"
alias l="ls -lah --group-directories-first --color=auto --almost-all --kibibytes -g --no-group --time-style='+'"
alias ll="ls -lah --group-directories-first --color=auto --almost-all"
alias grep='grep --colour=auto'
alias gpglist='gpg --list-secret-keys --keyid-format LONG'
alias v="nvim"
export EDITOR=nvim
export BROWSER=firefox-developer-edition
export PATH="$HOME/node_modules/.bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export MPD_HOST=$HOME/.config/mpd/socket

# if [[ ! `pgrep ssh-agent` ]]; then
# 	eval `ssh-agent -s`
# fi

xset r rate 133 50

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi
