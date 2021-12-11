# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/johnku/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""
fpath+=$HOME/.zsh/pure
# autoload -U promptinit; promptinit
# prompt pure

plugins=(
  git
  ag
  fzf
  history
)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/Users/johnku/bin:/Users/johnku/.emacs.d/bin/:/Users/johnku/go/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# alias em='TERM=screen-24bit emacsclient -t'
alias em='emacsclient -t'
alias em-kill="kill -9 $(ps aux | grep 'emacs-plus\@' | awk '{print $2}' | sed)"
alias em-restart="em-kill; emacsclient -e '(kill-emacs)'; emacs --daemon"
alias emm="em-restart; em"
alias d='go doc'
alias ll='exa -la'
alias ls='exa'
alias vim='nvim'

source ~/.zplug/init.zsh
zplug "changyuheng/fz", defer:1
zplug "agkozak/zsh-z"
zplug "rupa/z", use:z.sh
zplug load

#autoload -U promptinit; promptinit
#prompt pure
