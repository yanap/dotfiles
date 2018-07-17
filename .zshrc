#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# common path
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH=/usr/local/bin:$PATH

# for go with all development workplace
export GOPATH=$HOME/dev
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# for pip path
export PATH="$PATH:$HOME/Library/Python/2.7/bin"

# for react
export PATH=$PATH:./node_modules/.bin

# for alias
alias vi="/usr/bin/vim"
alias vim="nvim"
alias bye='sudo shutdown -h now'
alias gst='git status'
#alias diff='colordiff'
alias less='less -R'
export XDG_CONFIG_HOME="$HOME/.config"

# for git alias
alias gi="git init"
alias gs="git status"
alias ga="git add"
alias gcm="git commit -m"
alias gd="git diff"
alias gco="git checkout"
alias gpl="git pull"
alias gb="git branch"

# for Android
export PATH=/Users/yana/Library/Android/sdk/platform-tools:$PATH
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME="/Applications/Android/sdk"
export ANDROID_NDK_HOME="/Applications/Android/ndk"
export PATH=${PATH}:$ANDROID_NDK_HOME

# for perl
PERL_MB_OPT="--install_base \"/Users/yana/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/yana/perl5"; export PERL_MM_OPT;
export PERL5LIB="/Users/my_user/perl5/lib/perl5:/Library/Perl/5.16:/Applications/Xcode.app/Contents/Developer/Library/Perl/5.16"

# for peco
bindkey '^]' peco-src

function peco-src() {
  local src=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$src" ]; then
      BUFFER="cd $src"
      zle accept-line
  fi
  zle -R -c
}
zle -N peco-src

function peco-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | \
    eval $tac | \
    peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

#for rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

# for postgres
export PGDATA=/usr/local/var/postgres

# The next line updates PATH for the Google Cloud SDK.
#source '/Users/yana/google-cloud-sdk/path.zsh.inc'

# The next line enables bash completion for gcloud.
#source '/Users/yana/google-cloud-sdk/completion.zsh.inc'
