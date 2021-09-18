# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jku/.oh-my-zsh"
 . /usr/local/etc/profile.d/z.sh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

plugins=(
  ag
  git
  fzf
  history
  docker
)

source $ZSH/oh-my-zsh.sh
source $HOME/.env

# User configuration
export PATH="/Users/jku/bin:/Users/jku/.emacs.d/bin/:/Users/jku/.nvm/versions/node/v6.11.1/bin/:/Users/jku/go/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias em='TERM=screen-24bit emacsclient -t'
alias em-kill="kill -9 $(ps aux | grep 'emacs-plus\@' | awk '{print $2}' | sed)"
alias em-restart="em-kill; emacsclient -e '(kill-emacs)'; emacs --daemon"
alias k='kubectl'
alias w='whisper-admin'
alias d='docker'
alias h='helm'
alias ll='exa -la'
alias ls='exa'
alias vim='nvim'

source ~/.zplug/init.zsh
zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh
zplug load

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


[[ :$PATH: == *:$HOME/bin:* ]] || PATH=$HOME/bin:$PATH
. ~/.isd-cli-autocomplete-zsh
