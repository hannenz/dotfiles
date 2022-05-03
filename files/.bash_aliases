shopt -s expand_aliases


export CLICOLOR=1 # Colored output for ls on mac osx
ls --color=auto &>/dev/null && alias ls='ls -hN --color=auto --group-directories-first'

alias v='vim'
alias cp='cp -iv'
alias mv='mv -iv'
alias l='ls -l'
alias ll='ls -l'
alias la='ls -lart'
alias tree='tree -CF'
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
# alias mysql='mycli -u root -ppebble --auto-vertical-output'
if [[ $HOSTNAME == 't470' ]] ; then
	alias mysql='mycli -u admin -ppebble'
	alias mysqldump='mysqldump -u admin'
else 
	alias mysql='mycli -u root -ppebble'
	alias mysqldump='mysqldump -u root'
fi
alias g='git'
alias gp='gulp'
alias news='newsboat'
alias gco='git checkout'
alias glg='git lg'
# alias gc='git commit -m'
alias ga='git add'
alias gs='git status'
alias gd='git diff'
alias gpsh='git push'
alias gpll='git pull'
alias log='tail -f /var/log/apache2/error.log'
alias clr='clear'
alias c='clear'
alias shrug='echo "¯\_(ツ)_/¯"'
alias translate="dict -d fd-deu-eng" 
#alias sass-lint='sass-lint -qv -c /home/hannenz/.sasslintrc'
alias stylelint='stylelint --config ${HOME}/.stylelintrc.json'
alias tmx='tmux new-session \; split-window -h \; split-window -v \; resize-pane -t 2 -x 60 \; attach'
alias less='less -r'
alias cheat='cht.sh'
alias hplayer='mplayer -volume 100 -idle -cache-min 7 http://hannenz.homelinux.org:8000/mpd'
alias ncmpc='ncmpc --colors -h hannenz.homelinux.org'
alias diff='diff --color -u'
username=$(whoami)
case "${username}" in
	jbraun) 		alias ssh='TERM=screen ssh -F /home/jbraun/.ssh/config.halma' ;;
	johannesbraun) 	alias ssh='TERM=screen ssh -F /home/jbraun/.ssh/config.halma' ;;
	*) 				alias ssh='TERM=screen ssh -F /home/hannenz/.ssh/config' ;;
esac

# alias composer='/usr/local/bin/composer.phar'
command -v bat > /dev/null && alias cat=bat 
# alias vim='nvim'
alias rm='echo "This is not the command you are looking for - use trash!"; false'
# Enable cheating (and fullscreen) in supertux
alias supertux2='supertux2 --developer --fullscreen'
alias wttr='curl -H "Accept-Language: de" wttr.in/Oepfingen'

todofile=${HOME}/Nextcloud/todo.md
if [ ! -e $todofile ] ; then
	todofile=${HOME}/Nextcloud/HALMA/todo.md
fi
alias todo='tmux rename-window todo && vim $todofile'

function ts () {
	tmux send-keys -t 3 "$*" C-m
}

function zoom_join {
	case "${1}" in
		job|jobs)
			confno=402205043
			;;
		web)
			confno=629697406
			;;
		yoga)
			confno=629697406
			;;
	esac
	
	command -v xdg-open > /dev/null && xdg-open "zoommtg://zoom.us/join?confno=$confno"
	command -v open > /dev/null && open "zoommtg://zoom.us/join?confno=$confno"
}

function git-diff-in-vim {
	vim -p $(git diff "$1" --name-only) -c "tabdo Gdiff $1"
}
