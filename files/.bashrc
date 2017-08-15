#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set PATH
PATH="$PATH:.:/home/hannenz/bin:/home/hannenz/.local/bin:/home/hannenz/.local/bin/phpctags/bin"

# Load bash completion
if [ -f /etc/bash_completion ] ; then
	. /etc/bash_completion
fi

# Bashmarks (https://github.com/huyng/bashmarks)
source ${HOME}/.local/bin/bashmarks.sh

# Set VI mode
set -o vi
bind -m vi-command ".":insert-last-argument

export EDITOR="vim"
export GTK_IM_MODULE="xim"

# Colored Manpages
export MANPAGER=less
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode    
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan

# Aliases
#alias ls='ls -t'
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -lart'
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
alias news='newsbeuter'
alias gc='git commit -m'
alias ga='git add .'
alias gs='git status'
alias gd='git diff'
alias gpsh='git push'
alias gpll='git pull'
alias log='tail -f /var/log/apache2/error.log'
alias clr='clear'

alias shrug='echo "¯\_(ツ)_/¯" | xclip -se clipboard'

# Make a sql dump of the given database. Dump is written to /tmp
function mksqldump () {
    if [ $# -lt 1 ] ; then
        echo "usage: mksqldump database [email-address]"
        return
    fi
    dumpfile=/tmp/$1.$(hostname).$(date +%F-%H%M%S).sql.gz
    mysqldump -u root -ppebble $1 | gzip > "${dumpfile}"
    echo "Dump has been written to ${dumpfile}"
	if [ $# -eq 2 ] ; then
		thunderbird --compose "to=$2,subject=SQL-Dump `basename ${dumpfile}`,attachment=${dumpfile},format=text"
	fi
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
function smartresize() {
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
# pw=/usr/share/powerline/bindings/bash/powerline.sh
# function _update_ps1() {
#     if [ -f $pw ] ; then
# 		source $pw
#     fi
# }

. /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh



eval $(thefuck --alias)

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# Screenfetch only if in certain Terminator terminal
# if [[ $TERMINATOR_UUID = "urn:uuid:707249f9-d685-4330-95b3-016e1427c143" ]] ; then
#	screenfetch
# fi

function tea {
	if ! [[ $1 =~ ^[0-9]+$ ]] ; then
		echo "Give time in minutes"
		return -1;
	fi
	echo "notify-send \"Tea Time!\"" | at now + $1 minutes
	return 0;
}


#
# Tab completion for hosts in .netrc (ftp hosts)
#
function netrc_completion {
	for match in $(grep "machine.*${COMP_WORDS[$COMP_CWORD]}.*$" ${HOME}/.netrc | cut -d" " -f 2) ; do
		COMPREPLY=(${COMPREPLY[@]} "${match}")
	done
}
complete -F netrc_completion ftp ftpdiff

#
# Diff files over FTP
#
# USAGE: ftpdiff host remote_file local_file
#
function ftpdiff {
	ftp_hostname=$1
	remote_file=$2
	local_file=$3
	tmp_file=$(tempfile)

	ftp "$ftp_hostname" <<EOT 
	get "$remote_file" "$tmp_file"
	quit
EOT

	diff "$tmp_file" "$local_file"
}

function plankctl() {
	case $1 in 
		"on")
			gsettings set org.pantheon.desktop.cerbere monitored-processes "['wingpanel', 'plank']"
			;;

		"off")
			gsettings set org.pantheon.desktop.cerbere monitored-processes "['wingpanel']"
			killall plank
			;;

		*)
			echo "pankctl on|off"
			;;
	esac
}

alias translate="dict -d fd-deu-eng" 

# Don't record duplicates in history
export HISTCONTROL=ignoreboth:erasedups

# Start tmux
if [[ ! "$TERM" =~ "screen" ]]
then
	tmux attach-session -t "$USER" || tmux new-session -s "$USER"
fi

