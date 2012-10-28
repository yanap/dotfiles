
#path
export PATH=/opt/local/bin:/opt/local/sbin:$PATH #for mac ports
export MANPATH=/opt/local/man:$MANPATH #for mac ports
export PATH=~/bin:$PATH #my script
export PATH=/usr/local/sbin:$PATH # for Homebrew
export PATH=/usr/local/bin:$PATH  # for Homebrew
export PHP_HOME=$HOME/local/php/versions

# for encoding
export LANG=ja_JP.UTF-8
export PS1="\u@\w\$"
export TERM=xterm-color

# Application Shortcuts
alias cot='open -g -a CotEditor' # ターミナルからCotEditorを開く
alias safari='open -g -a safari' # ターミナルからSafariを開く
alias console='open -a console' # ターミナルからコンソールを開く

# for shortcut
alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'
alias ls='ls -GwF'
alias la='ls -alh'
alias ll='ls -lahG'
alias t='tar zxvf'
alias t-='tar xvf -'
alias b='bzip2 -dc'
alias dh='df -h'
alias vi='/usr/bin/vim'
alias v='/usr/bin/vim'
alias sr='screen -d -R'
alias grep='grep --exclude=*.svn*'
alias greprn='grep -rn --exclude=*.svn*'
alias bye='sudo shutdown -h now'
alias his='history'

# for svn
alias st='svn st'
alias stu='svn st -u'
alias sd='svn di'
alias sdi='svn di'
alias sad='svn add'
alias sup='svn up'
alias sci='svn ci'
alias scim='svn ci -m'

# for git
alias gst='git status'
alias gci='git commit'
alias gdi='git diff'
alias gdc='git diff --cached'
alias gad='git add'
#export GIT_PAGER="lv -c"

#iphone
export PLATFORM=iphoneOS
export VERSION=4.0
export SDK=/Developer/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${VERSION}.sdk/System/Library/Frameworks

export LSCOLORS=gxfxcxdxbxegedabagacad

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function precmd() {
  PROMPT="\h@\u:\W\$(parse_git_branch) \$ \n"
}
function proml {
  PS1="\h@\u:\W\$(parse_git_branch) \$ \n"
}
proml
