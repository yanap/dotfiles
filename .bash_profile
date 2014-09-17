if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/A12910/.gvm/bin/gvm-init.sh" ]] && source "/Users/A12910/.gvm/bin/gvm-init.sh"
