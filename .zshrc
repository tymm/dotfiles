# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="alanpeabody"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git deb autojump pip python node django)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

eval `dircolors $HOME/.dir_colors`

export LC_ALL="en_US.UTF-8"

# modify path according to my needs
export PATH=/usr/local/sbin:/home/tymm/bin:/opt/android-sdk/tools:/opt/android-sdk/platform-tools:$PATH

# define GOPATH
export GOPATH=/home/tymm/.go

# turn off terminal control codes for vim
alias vim="stty -ixon -ixoff ; vim"

# vim mode
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey -M viins 'jk' vi-cmd-mode

# 256 color support for tmux
export TERM=screen-256color-bce

# Load directory-history plugin which includes the history-substring-search plugin
source ~/.zsh-directory-history/directory-history.plugin.zsh

# Map <CTRL+j/k> to history-substring-search auto-completion
bindkey '^j' history-substring-search-up
bindkey '^k' history-substring-search-down

# Navigate through history in vim mode
bindkey -M vicmd 'k' directory-history-search-forward
bindkey -M vicmd 'j' directory-history-search-backward

# Aliases
source ~/.aliases

# Virtualenv
export WORKON_HOME=$HOME/.virtualenvs
source /etc/bash_completion.d/virtualenvwrapper

# Android
export ANDROID_HOME=/opt/android-sdk/
