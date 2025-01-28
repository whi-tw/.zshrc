alias rm="rm -v"
alias cp="cp -v"
alias mv="mv -v"
alias rename="rename -v"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

if (( $+commands[lsd] )); then
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

alias sysu="systemctl --user" ##TODO

(( $+commands[glow] )) && alias glow="glow -p"

(( $+commands[todo.sh] )) && alias t="todo.sh"

# Aliases for 1Password cli plugins
[[ -f "${HOME}/.op/plugins.sh" ]] && source "${HOME}/.op/plugins.sh"

(( $+commands[code-insiders] )) && alias code="code-insiders"

(( ! $+commands[bosh] )) && (( $+commands[bosh-cli] )) && alias bosh="bosh-cli"

(( $+commands[assume] )) && {
    alias assume="source ${commands[assume]}"
    alias awsconsole="assume --active-role"
}
