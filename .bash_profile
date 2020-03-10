alias ll="ls -l"
alias la="ls -la"
alias tmux="tmux -2"
alias release="z devops; . ~/venv/bin/activate"

alias g="go doc"

alias gotest="find . -name '*.go' -not -path './vendor/*' | entr -r -c go test ./... | grep -v vendor"
alias rebuild="find . -name '*.go' -not -path './vendor/*' | entr -r -c go build ./"
alias vim="nvim"
alias vi="nvim"

export TERM=screen-256color
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GO111MODULE=on
export PATH="/opt/local/bin:/opt/local/sbin:$HOME/bin:$GOPATH/bin:$PATH"

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

#if [ -f ~/.bashrc ]; then
#    . ~/.bashrc
#fi

# Z
. `brew --prefix`/etc/profile.d/z.sh

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
# export PATH
#
# # Setting PATH for Python 2.7
# # The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# export PATH


# ENV
. /Users/jku/.env
