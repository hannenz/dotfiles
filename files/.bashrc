#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[ -f ~/.fzf.bash ] && source ~/.fzf.bash



##########
#  PATH  #
##########

# Set PATH
PATH="/usr/local/bin:/Users/johannesbraun/.local/bin:$PATH:~/.vim/plugged/tagbar-phpctags.vim/build/phpctags-0.5.1/build:/home/hannenz/.local/bin"





################
#  COMPLETION  #
################

# Load bash completion (Linux)
if [ -f /etc/bash_completion ] ; then
	. /etc/bash_completion
fi
# Bash completion on osx (installed via homebrew)
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion



# cheat.sh completion
if [ -f ~/.cheat.sh.completion ] ; then
	. ~/.cheat.sh.completion
fi



# Tab completion for hosts in .netrc (ftp hosts)
function netrc_completion {
	for match in $(grep "machine.*${COMP_WORDS[$COMP_CWORD]}.*$" ${HOME}/.netrc | cut -d" " -f 2) ; do
		COMPREPLY=(${COMPREPLY[@]} "${match}")
	done
}
complete -F netrc_completion ftp ftpdiff



# pass completion suggested by @d4ndo (#362)
_fzf_complete_pass() {
  _fzf_complete '+m' "$@" < <(
    pwdir=${PASSWORD_STORE_DIR-~/.password-store/}
    stringsize="${#pwdir}"
    find "$pwdir" -name "*.gpg" -print |
        cut -c "$((stringsize + 1))"-  |
        sed -e 's/\(.*\)\.gpg/\1/'
  )
}

[ -n "$BASH" ] && complete -F _fzf_complete_pass -o default -o bashdefault pass



###############
#  BASHMARKS  #
###############

# Bashmarks (https://github.com/huyng/bashmarks)
test -e ${HOME}/.local/bin/bashmarks.sh && source ${HOME}/.local/bin/bashmarks.sh



#############
#  OPTIONS  #
#############

# Set VI mode
set -o vi
bind -m vi-command ".":insert-last-argument

# No ixoff (Allow vim to bind <C-s> to :w)
bind -r '\C-s'
stty -ixon



#################
#  ENVIRONMENT  #
#################

export EDITOR="vim"
export FCEDIT="vim"
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


#############
#  ALIASES  #
#############

source ~/.bash_aliases



###############
#  FUNCTIONS  #
###############

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
	if [ $# -ne 3 ] ; then
		echo "Usage: smartresize infile width outpath"
	else
    	mogrify -path "${3}" -filter Triangle -define filter:support=2 -thumbnail "${2}" -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB "${1}"
	fi 
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



# fetch .gitignore from gitignore.io
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}



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



# Lookup unicode by name
function ugrep() { exec 5< <(grep -i "$*" $(locate CharName.pm));while read <&5;do h=${REPLY%% *};/usr/bin/printf "\u$h\tU+%s\t%s\n" "$h" "${REPLY##$h }";done; }



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



function mkwritable () {
	sudo chown -R hannenz:www-data $1
	chmod -R g+w $1
}



#############
#  HISTORY  #
#############

# Always append
shopt -s histappend

# Share history between different tmux panes/windows
export PROMPT_COMMAND="history -a; history -n"

# Don't record duplicates in history
export HISTCONTROL=ignoreboth:erasedups



###################
#  PROMPT         #
#  Execute late!  #
###################

if [ -e ~/liquidprompt/liquidprompt ] ; then
	. ~/liquidprompt/liquidprompt
fi



##########
#  TMUX  #
##########

# Start tmux (https://unix.stackexchange.com/a/113768)
# Makes sure, that tmux exists, does not try to execute itself
# if command -v tmux >/dev/null; then
# 	[[ !  $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
# fi



export MYSQL_PWD=pebble
