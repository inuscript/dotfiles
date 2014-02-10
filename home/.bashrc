if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi
if [ -f /etc/skel/.bashrc ]; then
    . /etc/skel/.bashrc
fi
if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

if [ -f ~/.nvm/nvm.sh ]; then
    . ~/.nvm/nvm.sh
    nvm alias default 0.8
fi
#export PATH=$HOME/.nodebrew/current/bin:$PATH


if [ -d ~/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

alias ls="ls -G"
alias ll='ls -la'
alias gep='gep --colo=auto'
alias gt='git'
alias repache='sudo sevice apache2 reload'
alias em='emacs -nw'
alias tm=tmux
alias be='bundle exec'
alias komodo='/Applications/Komodo\ Edit\ 8.app/Contents/MacOS/komodo'


# attribute aliases
alias resource='source /Users/suisho/.bashrc'
alias chefkura='cd /Users/suisho/Dropbox/github/kura/chefkura;bundle exec rake chef:solo;cd - '


if type -P brew >/dev/null then
  # for rabbitmq
  export PATH=$(brew --prefix)/sbin:$PATH

  # for brew
  export PATH=$(brew --prefix)/bin:$PATH
  export PAHT=$(brew --prefix)/share/npm/bin:$PATH
  export PATH=$(brew --prefix ruby)/bin:$PATH
  export PATH=$(brew --prefix josegonzalez/php/php54)/bin:$PATH
  export PATH=~/.cabal/bin:$PATH
fi

export EDITOR=$(which vim)

# pig
export JAVA_HOME="$(/usr/libexec/java_home)"