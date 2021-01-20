alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [ "$commands[lsd]" != "" ]; then
    alias ls='lsd'
else
    alias ls="ls --color"
fi
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias mtr='mtr --curses'

alias delim="seq  -f "=" -s '' $(tput cols)"

alias sysu="systemctl --user"

alias glow="glow -p"
