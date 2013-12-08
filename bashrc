# export LANG=ja_JP.utf8
LC_CTYPE="en_US.UTF-8"
export LC_CTYPE
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# ps1
source ~/dotfiles/.git-prompt.sh
green='\[\033[1;32m\]';
blue='\[\033[1;34m\]';
cyan='\[\033[1;36m\]';
magenta='\[\033[1;35m\]';
red='\[\033[1;31m\]';
yellow='\[\033[1;33m\]';
default='\[\033[0m\]';
PS1='['$yellow'\u'$default'@'$green'\h'$default'] '$cyan'\w '$magenta' $(__git_ps1 "(%s)") '$default' \n$ ';

# for shortcut
alias ls='ls -GwF'
alias ll='ls -GwFalh'
alias la='ls -alh'
alias t='tar zxvf'
alias t-='tar xvf -'
alias b='bzip2 -dc'
alias dh='df -h'
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias grep='grep --exclude=*.svn*'
alias greprn='grep -rn --exclude=*.svn*'
alias bye='sudo shutdown -h now'
alias rsync='rsync --exclude=*.svn*'
alias gst='git status'
alias diff='colordiff'
alias less='less -R'

function share_history {
history -a
history -c
history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend

# editor
export EDITOR='vim'

# reset path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$HOME/bin"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# python
export PATH="/usr/local/share/python:$PATH"

# nodejs
export NODE_PATH=/usr/local/lib/node_modules

# bundle
alias be="bundle exec"

## z easy jump dir
. `brew --prefix`/etc/profile.d/z.sh
    function precmd () {
    _z --add "$(pwd -P)"
}
