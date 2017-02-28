# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="nebirhos"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# ---------
# MY STUFF
# ---------

# DISABLE THAT STUPID CTRL+S SCREEN FREZE
stty -ixon
# Remap CapsLock to Escape
# xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# --------
# ALIASES
# --------
alias mv="mv -v"
alias cp="cp -v"
alias mkdir="mkdir -vp"

alias grep='grep --colour=auto'

alias l="lsd --date relative --icon never --group-dirs first --all --long"
alias ll="ls -lah --group-directories-first --color=auto --almost-all --kibibytes -g --no-group --time-style='+'"
alias lll="ls -lah --group-directories-first --color=auto --almost-all"
# alias vim="nvim -n"

# -------------
# DEFAULT APPS
# -------------
export EDITOR=nvim
export BROWSER=chromium
export PATH="$HOME/node_modules/.bin:$HOME/.cargo/bin:$HOME/.opam/default/bin:$HOME/Programs/sublime_merge:$HOME/go/bin:$PATH"
# export RUST_SRC_PATH=/home/akhetopnu/.cargo/bin/racer

# ---------------------
# COLORFUL MANPAGES :D
# ---------------------
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# eval $(ssh-agent) > /dev/null
# if [[ ! `pgrep ssh-agent` ]]; then
# 	eval `ssh-agent -s`
# fi

export KITTY_CONFIG_DIRECTORY="~/.config/kitty/"

fpath+=~/.zfunc

# -------------------------------
# USTAWIENIA
# -------------------------------
# autoload -Uz compinit
# compinit

# autoload predict-on
# predict-on

autoload -Uz promptinit
promptinit

# prompt fire
# prompt fade white grey blue

setopt COMPLETE_ALIASES
# setopt MENU_COMPLETE
setopt menucomplete
# zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=5"

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export QT_QPA_PLATFORMTHEME=qt5ct
