# export LANG=ja_JP.utf8
LC_CTYPE="en_US.UTF-8"
export LC_CTYPE
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# ps1
green='\[\033[1;32m\]';
blue='\[\033[1;34m\]';
cyan='\[\033[1;36m\]';
magenta='\[\033[1;35m\]';
red='\[\033[1;31m\]';
yellow='\[\033[1;33m\]';
default='\[\033[0m\]';
PS1='['$yellow'\u'$default'@'$green'\h'$default'] '$cyan'\w '$default' \n$ ';

# for shortcut
alias ls='ls -GwF'
alias ll='ls -GwFalh'
alias la='ls -alh'

# for svn command shortcut
dir=~/Documents/01_works/006_furima
svndir="$dir/09_デザイン"
if [ -d $svndir ]; then
    echo 'already svndir.'
else
    mkdir -p $svndir
fi
alias m="cd $svndir"
alias f="cd $svndir && open ."
alias co="cd $dir && svn checkout http://172.17.127.150/svn/repos/repo/frma/trunk/doc/09_%E3%83%87%E3%82%B6%E3%82%A4%E3%83%B3/ && cd $svndir"
alias svncat="cd $svndir && svn cat http://172.17.127.150/svn/repos/repo/frma/trunk/doc/09_%E3%83%87%E3%82%B6%E3%82%A4%E3%83%B3/"
alias up="cd $svndir && svn update −−set-depth infinity"
alias st="cd $svndir && svn status"
alias ci="svn commit"
alias revert="svn revert"
alias all_revert="cd $svndir && svn revert --recursive ."
alias add="svn add"


#for my dev space
workspacepath=''
#alias src='cd '$workspacepath

function share_history {
history -a
history -c
history -r
}
PROMPT_COMMAND='share_history'
shopt -u histappend

# reset path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin/:$HOME/bin"
