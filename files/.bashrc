#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set PATH
PATH="$PATH:/home/hannenz/bin:/home/hannenz/.local/bin"

# Load bash completion
if [ -f /etc/bash_completion ] ; then
	. /etc/bash_completion
fi

# Bashmarks (https://github.com/huyng/bashmarks)
source ${HOME}/.local/bin/bashmarks.sh

# Set VI mode
set -o vi

export EDITOR="vim"
export GTK_IM_MODULE="xim"
export TERM=xterm-256color

# Aliases
#alias ls='ls -t'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias cd..='cd ..'
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

# Make a sql dump of the given database. Dump is written to /tmp
function mksqldump () {
    if [ $# -ne 1 ] ; then
        echo "usage: mksqldump table"
        return
    fi
    dumpfile=/tmp/$1.$(hostname).$(date +%F-%H%M%S).sql.gz
    mysqldump -u root -ppebble $1 | gzip > "${dumpfile}"
    echo "Dump has been written to ${dumpfile}"
}

# Lorem ipsum text to clipboard
function clipsum () {
	lipsum "$@" | tee /dev/tty | xclip
}

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


# POWERLINE Shell
function _update_ps1() {
    if [ -f ${HOME}/bin/powerline/powerline-shell/powerline-shell.py ] ; then
    	PS1="$(${HOME}/bin/powerline/powerline-shell/powerline-shell.py $? 2> /dev/null)"
    fi
}

if [ "$TERM" != "linux" ]; then
	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

eval $(thefuck --alias)

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

