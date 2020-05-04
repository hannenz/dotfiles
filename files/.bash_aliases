shopt -s expand_aliases


export CLICOLOR=1 # Colored output for ls on mac osx
ls --color=auto &>/dev/null && alias ls='ls --color=auto'

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
alias mysql='mysql -u root'
alias mysqldump='mysqldump -u root'
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
alias hplayer='mplayer -idle -cache-min 7 http://hannenz.homelinux.org:8000/mpd'
alias ncmpc='ncmpc --colors -h hannenz.homelinux.org'
alias ssh='TERM=screen ssh'
which bat > /dev/null && alias cat=bat 
# alias vim='nvim'

todofile=${HOME}/Nextcloud/todo.md
if [ ! -e $todofile ] ; then
	todofile=${HOME}/Nextcloud/HALMA/todo.md
fi
alias todo='tmux rename-window todo && vim $todofile'

function ts () {
	tmux send-keys -t 3 "$*" C-m
}
