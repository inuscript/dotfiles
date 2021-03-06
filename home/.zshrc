# Path to your oh-my-zsh configuration.

ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kphoen"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...



# if [ -f ~/.nvm/nvm.sh ]; then
#     . ~/.nvm/nvm.sh
#     nvm alias default 0.8
# fi
#export PATH=$HOME/.nodebrew/current/bin:$PATH


#if [ -d ~/.rbenv ]; then
#    export PATH="$HOME/.rbenv/bin:$PATH"
#    eval "$(rbenv init -)"
#fi

alias ls="ls -G"
alias ll='ls -la'
alias gep='gep --colo=auto'
alias gt='git'
alias z='zeus'
alias repache='sudo sevice apache2 reload'
alias em='emacs -nw'
alias tm=tmux
alias b='bundle'
alias be='bundle exec'
alias komodo='/Applications/Komodo\ Edit\ 8.app/Contents/MacOS/komodo'
alias subl='sublime *.sublime-project'
# attribute aliases
alias resource='source ~/.zshrc'
alias chefkura='cd /Users/suisho/Dropbox/github/kura/chefkura;bundle exec rake chef:solo;cd - '

if [ `which rmtrash` ]; then
  alias rm='rmtrash'
fi

# for mac
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line



BREW_PREFIX=`dirname $(dirname $(which brew))`
# BREW_PREFIX_RUBY=`brew --prefix ruby`
# for rabbitmq
export PATH=$BREW_PREFIX/sbin:$PATH

# for brew
export PATH=$BREW_PREFIX/bin:$PATH
export PATH=$BREW_PREFIX/share/npm/bin:$PATH
# export PATH=$BREW_PREFIX_RUBY/bin:$PATH
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight
export PATH=~/.gitcommands:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH="/usr/local/opt/openssl/bin:$PATH"
#export PATH=$(brew --prefix josegonzalez/php/php54)/bin:$PATH
#export PATH=~/.cabal/bin:$PATH

export EDITOR=$(which vim)

# pig
#export JAVA_HOME="$(/usr/libexec/java_home)"


# brew
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit -u

# chruby
if [ -d /usr/local/opt/chruby ]; then
    source /usr/local/opt/chruby/share/chruby/chruby.sh
    source /usr/local/opt/chruby/share/chruby/auto.sh
    chruby 2.3
fi
# if [ -d /usr/local/share/chruby ]; then
#     source /usr/local/share/chruby/chruby.sh
#     source /usr/local/share/chruby/auto.sh
# #    chruby 2.2
# fi

# include local
if [ -f ~/.zsh_local ]; then
    . ~/.zsh_local
fi

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
# if [ -d ~/.zsh/git-flow-completion ]; then
#   source ~/.zsh/git-flow-completion/git-flow-completion.zsh
# fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### direnv
#eval "$(direnv hook zsh)"

### pgsql
export PGDATA=/usr/local/var/postgres


#source .util/set_term_bgcolor.sh

#set_term_bgcolor 0 0 40

#Go
#export GOPATH=$HOME/code/gopath
#export PATH=$PATH:$GOPATH/bin

# if [ -x "`which go`" ]; then
#       export GOROOT=`go env GOROOT`
#       export GOPATH=$HOME/code/go-local
#       export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# fi

#nodebrew
# export PATH=$HOME/.nodebrew/current/bin:$PATH

# export PATH="$HOME/.yarn/bin:$PATH"


# brew cask install android-sdk
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"


# export LANG="ja_JP.utf8"

# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi
