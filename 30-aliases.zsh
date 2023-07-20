alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"
alias rename="rename -v"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if __command_is_present lsd; then
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

alias sysu="systemctl --user" ##TODO

__command_is_present glow && alias glow="glow -p"

__command_is_present todo.sh && alias t="todo.sh"

# Aliases for 1Password cli plugins
[[ -f "${HOME}/.op/plugins.sh" ]] && source "${HOME}/.op/plugins.sh"

__command_is_present code-insiders && alias code="code-insiders"

__command_is_absent bosh && __command_is_present bosh-cli && alias bosh="bosh-cli"
