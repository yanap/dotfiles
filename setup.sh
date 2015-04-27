#!/bin/bash

copy_dotfiles() {
  #TIME = `date "+%s"`
  #mkdir ~/backup_dotfiles
  #cp ~/backup_dotfiles/.zshrc_$TIME
  #cp ./.zshrc ~/.zshrc
  #cp ./.vimrc ~/.vimrc
  cp ./.tmux.conf ~/.tmux.conf
}

setup_mac() {
  # brew install
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # install packages
  brew install zsh vim git tmux tree htop the_silver_searcher go nmap
  brew install caskroom/cask/brew-cask
  brew tap peco/peco
  brew install peco
  brew tap motemen/ghq
  brew install ghq
  copy_files
}

setup_centos() {
  yum udpate -y
  yum install wget -y
  wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
  rpm -ivh epel-release-6-8.noarch.rpm
  yum --enablerepo=epel install zsh git vim tree htop -y
  rpm -ivh http://swiftsignal.com/packages/centos/6/x86_64/the-silver-searcher-0.13.1-1.el6.x86_64.rpm
  yum install go
  go get github.com/peco/peco/cmd/peco
  copy_files
}

function setup_ubuntu() {
  apt-get update -y
  apt-get install wget -y
  apt-get install curl htop vim git tree zsh -y
  apt-get install silversearcher-ag -y
  apt-get install golang -y
  go get github.com/peco/peco/cmd/peco
  copy_files
}

if [ `uname` = "Darwin" ]; then
#mac用のコード
  echo "mac"
  setup_mac
elif [ `uname` = "Linux" ]; then
#Linux用のコード
  if [ `which yum` = "/usr/bin/yum" ]; then
    echo "centos"
    setup_centos
  elif [ `which apt-get` = "/usr/bin/apt-get" ]; then
    echo "ubuntu"
    setup_ubuntu
  fi
fi
