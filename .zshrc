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

# for go
export GOPATH=${HOME}/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

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

# for alias
alias vim="mvim -v"

# for peco
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

# The next line updates PATH for the Google Cloud SDK.
source '/Users/yana/google-cloud-sdk/path.zsh.inc'

# The next line enables bash completion for gcloud.
source '/Users/yana/google-cloud-sdk/completion.zsh.inc'
