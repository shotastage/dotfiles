eval "$(pyenv init -)"
eval "$(direnv hook bash)"

alias vim='emacs'

export GOPATH=$HOME/go/
export PATH=$PATH:$GOPATH/bin
