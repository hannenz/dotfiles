#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#if [ -f /etc/bash_completion.d/git ] ; then
#	source /etc/bash_completion.d/git
#fi

# Bashmarks (https://github.com/huyng/bashmarks)
source ${HOME}/.local/bin/bashmarks.sh

# Aliases
alias ls='ls -t --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias cd..='cd ..'
alias td='todo.sh -d /home/hannenz/bin/todo.txt/todo.cfg'
alias tl='todo.sh ls'
alias ta='todo.sh add'
alias grep='grep --color=auto'
alias watch='watch --interval=1'
alias mount='mount| column -t'
alias update='sudo apt-get update && sudo apt-get upgrade -y'
alias ack='ack-grep'
alias xclip='xclip -se clipboard'
alias bc='bc -l'
alias clipsum='lipsum | tee /dev/tty | xclip'
alias isodate='date +%F-%H%M'
alias pgrep='pgrep -a'
alias mysql='mysql -u root -ppebble'
alias mysqldump='mysqldump -u root -ppebble'

#function pwgen () {
#    pwgen -B -N 1 $* | tee /dev/tty | xclip
#}

function mksqldump () {
    if [ $# -ne 1 ] ; then
        echo "usage: mksqldump table"
        return
    fi
    dumpfile=/tmp/$1.$(hostname).$(date +%F-%H%M%S).sql.gz
    mysqldump -u root -ppebble $1 | gzip > "${dumpfile}"
    echo "Dump has been written to ${dumpfile}"
}


function clipsum () {
	lipsum "$@" | tee /dev/tty | xclip
}


#PS1='\[\e[1;32m\][\u@\h \W] \[\e[0m\]\[\e[1;32m\]\$\[\e[0m\] '
#[ -n "$PS1" ] && source ~/.bash_prompt

if [ -f /etc/bash_completion ] ; then
	. /etc/bash_completion
fi

PATH="$PATH:/home/hannenz/bin:/home/hannenz/bin/adt-bundle/sdk/platform-tools:/home/hannenz/bin/todo.txt:/home/hannenz/.local/bin"

# Find files/dirs by name
function fname () {
    if [ $# == 1 ] ; then
    	find . -iname "*$@*"
    fi
    if [ $# == 2 ] ; then
        find "${1}" -iname "*${2}*"
    fi
}

#Grep in files - searches recursively in all files for the given pattern
function grif () {
	grep -RHin "$@" *
}

# »Save for web«-like image resize with imagemagick
smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

#export GIT_PS1_SHOWDIRTYSTATE=0
#export GIT_PS1_SHOWUNTRACKEDFILES=0
export EDITOR="vim"
#export TODOTXT_DEFAULT_ACTION=ls


# CD in a HALMA Job directory by Job ID
function jcd  {
        id="${1#*_}"
        year=20${id:0:2}
        dir=$(find /mnt/jobs/Jobs_$year -maxdepth 2 -type d -iname "*${1}*" -print -quit)
        if [ -d ${dir} ] ; then
                cd ${dir}
        fi
}


#cd in a project dir by project name
function pcd {
	dir=$(find ${HOME}/smbtom/htdocs -maxdepth 1 -type d -iname "*${1}*" -print -quit)
	if [ -d ${dir} ] ; then
		cd ${dir}
	fi
}

export GTK_IM_MODULE="xim"

export TERM=xterm-256color

# POWERLINE Shell
function _update_ps1() {
    if [ -f ${HOME}/bin/powerline/powerline-shell/powerline-shell.py ] ; then
    	PS1="$(${HOME}/bin/powerline/powerline-shell/powerline-shell.py $? 2> /dev/null)"
    fi
}

if [ "$TERM" != "linux" ]; then
	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Start tmux by default
#if command -v tmux>/dev/null; then
#    [[ ! $TERM =~ screen ]] && [ -x $TMUX ] && exec tmux
#fi

eval $(thefuck --alias)

# add this configuration to ~/.bashrc
#export HH_CONFIG=hicolor         # get more colors
#shopt -s histappend              # append new history items to .bash_history
#export HISTCONTROL=ignorespace   # leading space hides commands from history
#export HISTFILESIZE=10000        # increase history file size (default is 500)
#export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
#export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
#if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh \C-j"'; fi


shopt -s progcomp                                                               
timed_complete() {                                                              
    local partial                                                                 
    COMPREPLY=()                                                                  
    partial=${COMP_WORDS[COMP_CWORD]}                                             
    COMPREPLY=($(compgen -W '$( timed projects )' -- $partial))                   
    return 0                                                                      
}                                           
complete -F timed_complete -o dirnames timed

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
