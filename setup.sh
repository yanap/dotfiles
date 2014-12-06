#!/bin/bash

source ./lib.sh

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
