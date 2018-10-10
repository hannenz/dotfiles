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
alias mysql='mysql -u root -ppebble'
alias mysqldump='mysqldump -u root -ppebble'
alias news='newsbeuter'
alias gco='git checkout'
alias glg='git lg'
alias gc='git commit -m'
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
alias stylelint='stylelint --config /home/hannenz/.stylelintrc.json'
alias tmx='tmux new-session \; split-window -h \; split-window -v \; resize-pane -t 2 -x 60 \; attach'
alias less='less -r'
alias cheat='cht.sh'
# alias vim='nvim'

todofile=${HOME}/Nextcloud/todo
if [ ! -e $todofile ] ; then
	todofile=${HOME}/Nextcloud/HALMA/todo
fi
alias todo='vim $todofile'

function ts () {
	tmux send-keys -t 3 "$*" C-m
}
