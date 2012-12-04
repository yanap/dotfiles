# export LANG=ja_JP.utf8
LC_CTYPE="en_US.UTF-8"
export LC_CTYPE
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# ps1
source ~/.git-prompt.sh
PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ \n'

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

# bash_completion
BASH_COMPLETION=/usr/local/etc/bash_completion
BASH_COMPLETION_DIR=/usr/local/etc/bash_completion.d
BASH_COMPLETION_COMPAT_DIR=/usr/local/etc/bash_completion.d
if [ -f /usr/local/etc/bash_completion ]; then
    . /usr/local/etc/bash_completion
fi
