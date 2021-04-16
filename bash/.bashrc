#!/bin/bash

#Colors on man pages:
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}


parse_git_branch() {
		git branch 2> /dev/null | cut -d' ' -f2 | tr -d '\n'
}

export PS1='\[\033[38;5;82m\]\u@\h:\[\033[1;34m\] \W\[\033[1;34m\] $(parse_git_branch)> \[\033[0m\]'

#BASH VIM
set -o vi

#ALIASES
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias python='/usr/bin/python3'
alias sp='sudo pacman'
alias vpn='sudo openconnect https://remote.au.dk/au-access -u au618187@uni.au.dk'
alias config='/usr/bin/git --git-dir=$HOME/gitdots --work-tree=$HOME'
alias vpn='sudo openconnect https://remote.au.dk/au-access -u au618187@uni.au.dk'
alias tle="curl -s http://celestrak.net/NORAD/elements/cubesat.txt | sed -ne '/DELPH/{p;n;p;n;p}'"
alias imgbk="rsync --progress -Pzz ms100@10.28.2.15:~/gomspace/mission/*.jpg /home/chris/Dokumenter/imgs/ && rsync -Pz ms100@10.28.2.15:~/pycspterm/scripts/*.jpg /home/chris/Dokumenter/imgs/"
alias imgbkf="scp ms100@10.28.2.15:~/gomspace/mission/*[0-9].jpg /home/chris/full_imgs/"
alias sync="ssh ms100@10.28.2.15 ls gomspace/mission/ | grep img | sed -e 's/img//g' -e 's/\_thumb.jpg.map/,0/g' -e 's/\_thumb.jpg/,1/g' -e 's/.jpg.map/,2/g' -e 's/.jpg/,3/g' >> local.csv"
alias gnd='ssh -L 8080:localhost:8080 -L 3000:localhost:3000 ms100@10.28.2.15'
alias nnn='nnn -e'
alias wget='wget --no-hsts'



source /home/chris/.config/broot/launcher/bash/br
