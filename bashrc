# export LANG=ja_JP.utf8
LC_CTYPE="en_US.UTF-8"
export LC_CTYPE
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# ps1
source ~/.git-prompt.sh
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
alias vi='vim'
alias v='vim'
alias grep='grep --exclude=*.svn*'
alias greprn='grep -rn --exclude=*.svn*'
alias bye='sudo shutdown -h now'
alias rsync='rsync --exclude=*.svn*'
alias gst='git status'

#for my dev space
workspacepath='/Volumes/frma/git/src'
alias src='cd '$workspacepath
alias web='cd '$workspacepath'/web'
alias app='cd '$workspacepath'/web/application'
alias model='cd '$workspacepath'/web/application/models'
alias lib='cd '$workspacepath'/web/application/libraries'
alias helper='cd '$workspacepath'/web/application/helpers'
alias batch='cd '$workspacepath'/batch'
alias cstool='cd '$workspacepath'/cstools'

function share_history {
history -a
history -c
history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend

export EDITOR='subl -w'

#export PATH="$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin/:$HOME/bin"
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin/:$HOME/bin"
#eval "$(rbenv init -)"
#`ln -s /usr/bin/vagrant /Users/yanap/.rbenv/shims/vagrant`