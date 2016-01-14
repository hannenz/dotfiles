#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
#if [ -f /etc/bash_completion.d/git ] ; then
#	source /etc/bash_completion.d/git
#fi


# Aliases
alias ls='ls --color=auto'
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

function clipsum () {
	lipsum "$@" | tee /dev/tty | xclip
}


#PS1='\[\e[1;32m\][\u@\h \W] \[\e[0m\]\[\e[1;32m\]\$\[\e[0m\] '
[ -n "$PS1" ] && source ~/.bash_prompt

if [ -f /etc/bash_completion ] ; then
	. /etc/bash_completion
fi

PATH="$PATH:/home/hannenz/bin:/home/hannenz/bin/adt-bundle/sdk/platform-tools:/home/hannenz/bin/todo.txt"

# Find files/dirs by name
function fname () {
	find . -iname "*$@*"
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

alias pwgen='pwgen -B -N 1'

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

# Find a HALMA job 
function jl {
	find /media/jobs -maxdepth 3 -type d -iname "*${1}*" -print | while read file ; do if [ -d "${file}" ] ; then basename "${file}" ; fi ; done
}

export GTK_IM_MODULE="xim"

export PATH=~/pebble-dev/PebbleSDK-2.8.1/bin:$PATH
export PEBBLE_PHONE="192.168.2.162"


export TERM=xterm-256color

function _update_ps1() {
	PS1="$(~/bin/powerline/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
