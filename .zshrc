export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="muse"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

alias vida='ssh -C -i ~/.ssh/vida_rsa kinda@139.162.15.194'

alias siri='say hey siri;say '

alias glog="git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s' --graph"


export NVM_DIR="/Users/kinda/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use v4.2.4

# VIM setting for YouCompleteMe and TernJS
#ln -s `which node` /usr/local/bin/node
#ln -s `which npm` /usr/local/bin/npm
#ln -s `which tern` /usr/local/bin/tern
#ln -s `which eslint` /usr/local/bin/eslint
