# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# . /usr/local/etc/profile.d/z.sh

# User configuration
export PATH="/Users/johnku/bin:/Users/johnku/.emacs.d/bin/:/Users/johnku/go/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias em='TERM=screen-24bit emacsclient -t'
alias em-kill="kill -9 $(ps aux | grep 'emacs-plus\@' | awk '{print $2}' | sed)"
alias em-restart="em-kill; emacsclient -e '(kill-emacs)'; emacs --daemon"
alias emm="em-restart; em"
alias d='go doc'
alias ll='exa -la'
alias ls='exa'
alias vim='nvim'
alias cs='canvas-sketch-cli'

source ~/.zplug/init.zsh
zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug load
fpath=($fpath "/Users/johnku/.zfunctions")


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
