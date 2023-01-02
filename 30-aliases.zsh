alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"
alias rename="rename -v"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if [ -n "${commands[lsd]}" ]; then
    alias ls='lsd'
else
    alias ls="ls --color"
fi
alias l='ls -CF'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias lt='ls --tree'

alias mtr='mtr --curses'

alias delim="seq  -f "=" -s '' $(tput cols)"

alias sysu="systemctl --user"

alias glow="glow -p"

alias t="todo.sh"

# Aliases for 1Password cli plugins
[[ -f "${HOME}/.op/plugins.sh" ]] && source "${HOME}/.op/plugins.sh"
