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
[[ :$PATH: == *:$HOME/bin:* ]] || PATH=$HOME/bin:$PATH
# If AppleConnect does not work, you can get CAPRI_APP_ID and CAPRI_APP_KEY from  https://capri-developer.apple.com
# export CAPRI_APP_ID=XXX
# export CAPRI_APP_KEY=XXX
# If AppleConnect does not work, you can get ADB_APP_ID and ADB_APP_KEY from  https://adb-developer.apple.com
# export ADB_APP_ID=XXX
# export ADB_APP_KEY=XXX
# You can get ADB_UAT_APP_ID and ADB_UAT_APP_KEY from https://adb-uat-developer.corp.apple.com
# export ADB_UAT_APP_ID=XXX
# export ADB_UAT_APP_KEY=XXX
# If AppleConnect does not work, you can get METRON_APP_ID and METRON_APP_KEY from  metron@group.apple.com
# export METRON_APP_ID=XXX
# export METRON_APP_KEY=XXX
# If AppleConnect does not work, you can get CONNECT_APP_ID and CONNECT_APP_KEY from  circuitdb-dev@group.apple.com
# export CONNECT_APP_ID=XXX
# export CONNECT_APP_KEY=XXX
# If AppleConnect does not work, you can get GENERIC_APP_ID and GENERIC_APP_KEY from  the api provider
# export GENERIC_APP_ID=XXX
# export GENERIC_APP_KEY=XXX
# export GENERIC_BASE_URL=https://example-api.corp.apple.com
# If AppleConnect does not work, you can get GROOT_GNSD_APP_ID and GROOT_GNSD_APP_KEY from  https://bits.corp.apple.com/support/?appName=groot
# export GROOT_GNSD_APP_ID=XXX
# export GROOT_GNSD_APP_KEY=XXX
complete -C /usr/local/bin/bit bit
# You can get GITHUB_TOKEN from https://github.pie.apple.com/settings/tokens
# export GITHUB_TOKEN=XXX
# export CAPRI_A3_ID=XXX
# export CAPRI_A3_KEY=XXX
# export CAPRI_A3_CONTEXT=XXX
# export ADB_A3_ID=XXX
# export ADB_A3_KEY=XXX
# export ADB_A3_CONTEXT=XXX
# If AppleConnect does not work, you can get ADBLM_APP_ID and ADBLM_APP_KEY from  the developer team
# export ADBLM_APP_ID=XXX
# export ADBLM_APP_KEY=XXX
# If AppleConnect does not work, you can get ADBREPAIR_APP_ID and ADBREPAIR_APP_KEY from  the developer team
# export ADBREPAIR_APP_ID=XXX
# export ADBREPAIR_APP_KEY=XXX
# If AppleConnect does not work, you can get AIRFOILWING_APP_ID and AIRFOILWING_APP_KEY from  the developer team
# export AIRFOILWING_APP_ID=XXX
# export AIRFOILWING_APP_KEY=XXX
# If AppleConnect does not work, you can get DCI_APP_ID and DCI_APP_KEY from  the DCI support team
# export DCI_APP_ID=XXX
# export DCI_APP_KEY=XXX
# export DCI_A3_ID=XXX
# export DCI_A3_KEY=XXX
# export DCI_A3_CONTEXT=XXX
